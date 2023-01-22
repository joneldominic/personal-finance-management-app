import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao_impl.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/data/repositories/transaction_repository.dart';
import 'package:stacked/stacked.dart';

class TransactionService with ReactiveServiceMixin {
  final _logger = getLogger('TransactionService');
  final _transactionRepository =
      TransactionRepository(transactionDao: TransactionDaoImpl());

  Future<Transaction> createTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');
    return _transactionRepository.createTransaction(transaction);
  }

  Future<List<Transaction>> createTransactions(List<Transaction> transactions) {
    _logger.i('argument: $transactions');
    return _transactionRepository.createTransactions(transactions);
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');
    return _transactionRepository.updateTransaction(transaction);
  }

  Future<Id> deleteTransaction(Id id) async {
    _logger.i('argument: $id');
    return _transactionRepository.deleteTransaction(id);
  }

  Future<List<Transaction>> getTransactions() async {
    _logger.i('argument: NONE');
    return _transactionRepository.getTransactions();
  }

  Stream<List<Transaction>> transactionCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* _transactionRepository.transactionCollectionStream();
  }
}
