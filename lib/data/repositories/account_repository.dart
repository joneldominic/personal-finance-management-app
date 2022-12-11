import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class AccountRepository {
  final AccountDao accountDao;

  AccountRepository({required this.accountDao});

  Future<Account> createAccount(Account account) async {
    return accountDao.createAccount(account);
  }

  Future<Account> updateAccount(Account account) async {
    return accountDao.updateAccount(account);
  }

  Future<Id> deleteAccount(Id id) async {
    return accountDao.deleteAccount(id);
  }

  Future<List<Account>> getAccounts() async {
    return accountDao.getAccounts();
  }

  Stream<List<Account>> accountCollectionStream() async* {
    yield* accountDao.accountCollectionStream();
  }
}
