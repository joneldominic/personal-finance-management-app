import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/dao/cashflow_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
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
    final accountsCollection = isar.accounts;

    final transactionsStream = transactionCollection.where().sortByDateDesc().build().watch();
    final accountsStream = accountsCollection.watchLazy(fireImmediately: true);

    transactionsStream.listen((transactions) async {
      syncCashFlow(transactions);
    });

    accountsStream.listen((_) {
      final transactions = transactionCollection.where().findAllSync();
      syncCashFlow(transactions);
    });
  }

  void syncCashFlow(List<Transaction> transactions) async {
    final cashFlow = await getCashFlowById(CASH_FLOW_ID);
    if (cashFlow == null) return;

    final now = DateTime.now();
    final filteredTransactions = transactions.where((t) {
      final difference = now.difference(t.date!);

      t.account.loadSync();
      final isAccountSelected = t.account.value?.isSelected ?? false;

      return (difference.inDays < cashFlow.daysCount! && isAccountSelected);
    });

    Decimal incomeAcc = Decimal.zero;
    Decimal expensesAcc = Decimal.zero;

    for (Transaction t in filteredTransactions) {
      if (t.transactionType == TransactionType.transfer) {
        continue;
      }

      if (t.transactionType == TransactionType.expense) {
        expensesAcc += t.dAmount;
        continue;
      }

      incomeAcc += t.dAmount;
    }

    double tempExpenseAccAbs = expensesAcc.toDouble().abs();
    double percentageDiff = 1 -
        ((incomeAcc.toDouble() - tempExpenseAccAbs).abs() /
            ((incomeAcc.toDouble() + tempExpenseAccAbs) / 2));
    Decimal tempNet = incomeAcc - Decimal.parse(tempExpenseAccAbs.toString());

    cashFlow.net = tempNet.toDouble();
    cashFlow.income = incomeAcc.toDouble();
    cashFlow.expenses = expensesAcc.toDouble();

    if (tempNet.toDouble() == 0) {
      cashFlow.incomePercentage = 0;
      cashFlow.expensesPercentage = 0;
    } else if (tempNet.toDouble() > 0) {
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
