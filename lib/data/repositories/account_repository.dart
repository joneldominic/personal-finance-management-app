import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class AccountRepository {
  final _logger = getLogger('AccountRepository');
  final AccountDao accountDao;
  final TransactionDao transactionDao;

  AccountRepository({required this.accountDao, required this.transactionDao});

  Future<Account> createAccount(Account account) {
    _logger.i('argument: $account');
    return accountDao.createAccount(account);
  }

  Future<Account> updateAccount(Account account) {
    _logger.i('argument: $account');
    return accountDao.updateAccount(account);
  }

  Future<Id> deleteAccount(Id id) async {
    _logger.i('argument: $id');

    final account = await accountDao.getAccountById(id);

    await account.transactions.load();
    await account.destTransactions.load();

    final accountTransactions = account.transactions.toList();
    final accountDestTransactions = account.destTransactions.toList();

    final transactionsIds = accountTransactions
        .where((t) {
          if (t.transactionType != TransactionType.transfer) {
            return true;
          }

          if (t.transferTransactionType == TransactionType.expense) {
            return true;
          }

          return false;
        })
        .map((t) => t.id)
        .toList();

    final destTransactionIds = accountDestTransactions
        .where((t) {
          if (t.transferTransactionType == TransactionType.expense) {
            return false;
          }

          return true;
        })
        .map((t) => t.id)
        .toList();

    await transactionDao.deleteTransactions([...transactionsIds, ...destTransactionIds]);

    return accountDao.deleteAccount(id);
  }

  Future<List<Account>> getAccounts() {
    _logger.i('argument: NONE');
    return accountDao.getAccounts();
  }

  Stream<List<Account>> accountCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* accountDao.accountCollectionStream();
  }
}
