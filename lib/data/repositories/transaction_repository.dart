import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class TransactionRepository {
  final _logger = getLogger('CategoryRepository');
  final TransactionDao transactionDao;
  final AccountDao accountDao;

  TransactionRepository({required this.transactionDao, required this.accountDao});

  Future<Transaction> createTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');

    final newTransaction = await transactionDao.createTransaction(transaction);
    await updateAccountBalance(transaction);

    return newTransaction;
  }

  Future<List<Transaction>> createPairTransaction(List<Transaction> transactions) async {
    _logger.i('argument: $transactions');

    final newTransactions = await transactionDao.createTransactions(transactions);
    await updateAccountBalance(transactions[0]);

    return newTransactions;
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');

    await undoOldTransaction(transaction.id);
    final updatedTransaction = await transactionDao.updateTransaction(transaction);
    await updateAccountBalance(transaction);

    return updatedTransaction;
  }

  Future<Id> deleteTransaction(Id id) async {
    _logger.i('argument: $id');

    await undoOldTransaction(id);
    return transactionDao.deleteTransaction(id);
  }

  Future<int> deleteTransactionsByTransferId(String transferId) async {
    _logger.i('argument: $transferId');

    final transactionsPair = await transactionDao.getTransactionsByTransferId(transferId);
    await undoOldTransaction(transactionsPair[0].id);
    return transactionDao.deleteTransactionsByTransferId(transferId);
  }

  Future<List<Transaction>> getTransactions() {
    _logger.i('argument: NONE');
    return transactionDao.getTransactions();
  }

  Stream<List<Transaction>> transactionCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* transactionDao.transactionCollectionStream();
  }

  /// Helper functions
  /// **********************************************************************************************

  Future<void> updateAccountBalance(Transaction transaction) async {
    await transaction.account.load();
    final account = transaction.account.value!;
    Account? destinationAccount;

    switch (transaction.transactionType) {
      case TransactionType.income:
      case TransactionType.expense:
        account.balance = (account.dBalance + transaction.dAmount).toDouble();
        break;
      case TransactionType.transfer:
        await transaction.destinationAccount.load();
        destinationAccount = transaction.destinationAccount.value!;

        account.balance = (account.dBalance - transaction.dAmountAbs).toDouble();
        destinationAccount.balance =
            (destinationAccount.dBalance + transaction.dAmountAbs).toDouble();
        break;
      default:
        throw TypeError();
    }

    await accountDao.updateAccount(account);
    if (destinationAccount != null) {
      await accountDao.updateAccount(destinationAccount);
    }
  }

  Future<void> undoOldTransaction(Id id) async {
    final oldTransaction = await transactionDao.getTransactionById(id);
    final account = oldTransaction.account.value;
    Account? destinationAccount;

    switch (oldTransaction.transactionType) {
      case TransactionType.income:
        if (account != null) {
          account.balance = (account.dBalance - oldTransaction.dAmount).toDouble();
        }
        break;
      case TransactionType.expense:
        if (account != null) {
          account.balance = (account.dBalance + oldTransaction.dAmountAbs).toDouble();
        }
        break;
      case TransactionType.transfer:
        if (account != null) {
          account.balance = (account.dBalance + oldTransaction.dAmountAbs).toDouble();
        }

        destinationAccount = oldTransaction.destinationAccount.value;
        if (destinationAccount != null) {
          destinationAccount.balance =
              (destinationAccount.dBalance - oldTransaction.dAmountAbs).toDouble();
        }
        break;
      default:
        throw TypeError();
    }

    if (account != null) {
      await accountDao.updateAccount(account);
    }

    if (destinationAccount != null) {
      await accountDao.updateAccount(destinationAccount);
    }
  }
}
