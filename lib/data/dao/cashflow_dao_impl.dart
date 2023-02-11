import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/dao/cashflow_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class CashFlowDaoImpl extends CashFlowDao {
  static final CashFlowDaoImpl _cashFlowDaoImpl = CashFlowDaoImpl._internal();

  factory CashFlowDaoImpl() {
    return _cashFlowDaoImpl;
  }

  CashFlowDaoImpl._internal() {
    _setUpWatchers();
  }

  final _logger = getLogger('CashFlowDaoImpl');

  Future<Isar> get _db async => await IsarDatabase.instance.database;

  void _setUpWatchers() async {
    Isar isar = await _db;

    final transactionCollection = isar.transactions;

    final transactionsStream = transactionCollection.where().sortByDateDesc().build().watch();
    transactionsStream.listen((transactions) async {
      syncCashFlow(transactions);
    });
  }

  void syncCashFlow(List<Transaction> transactions) async {
    final cashFlow = await getCashFlowById(CASH_FLOW_ID);
    if (cashFlow == null) return;

    final now = DateTime.now();
    final filteredTransactions = transactions.where((t) {
      final difference = now.difference(t.date!);
      return difference.inDays < cashFlow.daysCount!;
    });

    double incomeAcc = 0;
    double expensesAcc = 0;

    for (Transaction t in filteredTransactions) {
      final isExpense = (t.transferTransactionType ?? t.transactionType) == TransactionType.expense;
      if (isExpense) {
        expensesAcc += t.amount!;
        continue;
      }

      incomeAcc += t.amount!;
    }

    double tempExpenseAccAbs = expensesAcc.abs();
    double tempNet = incomeAcc - tempExpenseAccAbs;
    double percentageDiff =
        1 - ((incomeAcc - tempExpenseAccAbs).abs() / ((incomeAcc + tempExpenseAccAbs) / 2));

    cashFlow.net = tempNet;
    cashFlow.income = incomeAcc;
    cashFlow.expenses = expensesAcc;

    if (tempNet == 0) {
      cashFlow.incomePercentage = 0;
      cashFlow.expensesPercentage = 0;
    } else if (tempNet > 0) {
      cashFlow.incomePercentage = 1.0;
      cashFlow.expensesPercentage = percentageDiff;
    } else {
      cashFlow.incomePercentage = percentageDiff;
      cashFlow.expensesPercentage = 1.0;
    }

    await updateCashFlow(cashFlow);
  }

  @override
  Future<CashFlow> createCashFlow(CashFlow cashFlow) async {
    _logger.i('argument: $cashFlow');

    Isar isar = await _db;

    final cashFlowCollection = isar.cashFlows;
    final createdCashFlow = await isar.writeTxn(() async {
      final id = await cashFlowCollection.put(cashFlow);
      return await cashFlowCollection.get(id);
    });

    return createdCashFlow!;
  }

  @override
  Future<CashFlow?> getCashFlowById(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;

    final cashFlowCollection = isar.cashFlows;
    final cashFlow = await isar.writeTxn(() async {
      return await cashFlowCollection.get(id);
    });

    return cashFlow!;
  }

  @override
  Future<CashFlow> updateCashFlow(CashFlow cashFlow) async {
    _logger.i('argument: $cashFlow');

    Isar isar = await _db;

    final cashFlowCollection = isar.cashFlows;
    final updatedCashFlow = await isar.writeTxn(() async {
      await cashFlowCollection.put(cashFlow);
      return cashFlow;
    });

    return updatedCashFlow;
  }

  @override
  Stream<CashFlow?> watchCashFlowById(Id id) async* {
    _logger.i('argument: $id');

    Isar isar = await _db;
    final cashFlowsCollection = isar.cashFlows;

    yield* cashFlowsCollection.watchObject(id, fireImmediately: true);
  }
}
