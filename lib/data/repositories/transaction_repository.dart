import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class TransactionRepository {
  final TransactionDao transactionDao;
  // TODO: Add logger

  TransactionRepository({required this.transactionDao});

  Future<Transaction> createTransaction(Transaction transaction) async {
    return transactionDao.createTransaction(transaction);
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    return transactionDao.updateTransaction(transaction);
  }

  Future<Id> deleteTransaction(Id id) async {
    return transactionDao.deleteTransaction(id);
  }

  Future<List<Transaction>> getTransactions() async {
    return transactionDao.getTransactions();
  }

  // Stream<List<Transaction>> TransactionCollectionStream() async* {
  //   yield* transactionDao.transactionCollectionStream();
  // }
}
