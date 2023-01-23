import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class TransactionDaoImpl extends TransactionDao {
  final _logger = getLogger('TransactionDaoImpl');

  Future<Isar> get _db async => await IsarDatabase.instance.database;

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final createdTransaction = await isar.writeTxn(() async {
      final id = await transactionCollection.put(transaction);
      return await transactionCollection.get(id);
    });

    return createdTransaction!;
  }

  @override
  Future<List<Transaction>> createTransactions(List<Transaction> transactions) async {
    _logger.i('argument: $transactions');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final createdTransactions = await isar.writeTxn(() async {
      final ids = await transactionCollection.putAll(transactions);
      return await transactionCollection.getAll(ids);
    });

    return createdTransactions.cast<Transaction>();
  }

  @override
  Future<Transaction> getTransactionById(Id id) async {
    _logger.i('argument: $id');

    // ignore: unused_local_variable
    Isar isar = await _db;

    return Future.error("");
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    _logger.i('argument: NONE');

    // ignore: unused_local_variable
    Isar isar = await _db;

    return Future.error("");
  }

  @override
  Future<Transaction> updateTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');

    Isar isar = await _db;

    // TODO: Implement transfer update logic

    final transactionCollection = isar.transactions;
    final updatedTransaction = await isar.writeTxn(() async {
      await transactionCollection.put(transaction);
      return transaction;
    });

    return updatedTransaction;
  }

  @override
  Future<Id> deleteTransaction(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;
    final transactionCollection = isar.transactions;
    final isDeleted = await isar.writeTxn(() async {
      return await transactionCollection.delete(id);
    });

    return isDeleted ? id : -1;
  }

  @override
  Future<int> deleteTransactionsByTransferId(String transferId) async {
    _logger.i('argument: $transferId');

    Isar isar = await _db;
    final transactionCollection = isar.transactions;
    final deleteCount = await isar.writeTxn(() async {
      return await transactionCollection.filter().transferIdEqualTo(transferId).deleteAll();
    });

    return deleteCount;
  }

  @override
  Stream<List<Transaction>> transactionCollectionStream() async* {
    _logger.i('argument: NONE');
    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    Query<Transaction> transactionsQuery = transactionCollection.where().build();

    yield* transactionsQuery.watch(fireImmediately: true);
  }
}
