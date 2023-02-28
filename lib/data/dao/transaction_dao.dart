import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

abstract class TransactionDao {
  Future<Transaction> createTransaction(Transaction transaction);
  Future<List<Transaction>> createTransactions(List<Transaction> transactions);
  Future<Transaction> getTransactionById(Id id);
  Future<List<Transaction>> getTransactions();
  Future<List<Transaction>> getRecentTransactions();
  Future<List<Transaction>> getTransactionsByTransferId(String transferId);
  Future<Transaction> updateTransaction(Transaction transaction);
  Future<Id> deleteTransaction(Id id);
  Future<int> deleteTransactionsByTransferId(String transferId);
  Future<int> deleteTransactions(List<int> ids);
  Stream<List<Transaction>> transactionCollectionStream();
  Stream<List<Transaction>> recentTransactionCollectionStream();
}
