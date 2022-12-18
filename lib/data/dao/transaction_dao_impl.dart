import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class TransactionDaoImpl extends TransactionDao {
  Future<Isar> get _db async => await IsarDatabase.instance.database;
  // TODO: Add logger

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final createdTransaction = await isar.writeTxn(() async {
      final id = await transactionCollection.put(transaction);
      return await transactionCollection.get(id);
    });

    return createdTransaction!;
  }

  @override
  Future<Transaction> getTransactionById(Id id) async {
    Isar isar = await _db;

    return Future.error("");
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    Isar isar = await _db;

    return Future.error("");
  }

  @override
  Future<Transaction> updateTransaction(Transaction transaction) async {
    Isar isar = await _db;

    return Future.error("");
  }

  @override
  Future<Id> deleteTransaction(Id id) async {
    Isar isar = await _db;

    return Future.error("");
  }
  // Stream<List<Transaction>> accountCollectionStream();
}
