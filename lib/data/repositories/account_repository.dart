import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class AccountRepository {
  final _logger = getLogger('AccountRepository');
  final AccountDao accountDao;

  AccountRepository({required this.accountDao});

  Future<Account> createAccount(Account account) async {
    _logger.i('argument: $account');
    return accountDao.createAccount(account);
  }

  Future<Account> updateAccount(Account account) async {
    _logger.i('argument: $account');
    return accountDao.updateAccount(account);
  }

  Future<Id> deleteAccount(Id id) async {
    _logger.i('argument: $id');
    return accountDao.deleteAccount(id);
  }

  Future<List<Account>> getAccounts() async {
    _logger.i('argument: NONE');
    return accountDao.getAccounts();
  }

  Stream<List<Account>> accountCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* accountDao.accountCollectionStream();
  }
}
