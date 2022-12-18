import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

abstract class TransactionDao {
  Future<Transaction> createTransaction(Transaction transaction);
  Future<Transaction> getTransactionById(Id id);
  Future<List<Transaction>> getTransactions();
  Future<Transaction> updateTransaction(Transaction transaction);
  Future<Id> deleteTransaction(Id id);
  // Stream<List<Transaction>> accountCollectionStream();
}
