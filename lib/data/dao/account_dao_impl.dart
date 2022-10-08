import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class AccountDaoImpl extends AccountDao {
  Future<Isar> get _db async => await IsarDatabase.instance.database;

  @override
  Future<Account> createAccount(Account account) async {
    Isar isar = await _db;

    final createdAccount = await isar.writeTxn(() async {
      final accountCollection = isar.accounts;
      final id = await accountCollection.put(account);
      return await accountCollection.get(id);
    });

    return createdAccount!;
  }

  @override
  Future<Id> deleteAccount(Id id) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Account> getAccountById(Id id) {
    // TODO: implement getAccountById
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getAccounts() async {
    Isar isar = await _db;

    final createdAccount = await isar.writeTxn(() async {
      final accountCollection = isar.accounts;
      return await accountCollection.where().findAll();
    });

    return createdAccount;
  }

  @override
  Future<Account> updateAccount(Id id) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  /* 
    Stream<void> userChanged = isar.users.watchLazy();
userChanged.listen(() {
  print('A User changed');
});
   */

  @override
  Stream<List<Account>> accountCollectionStream() async* {
    Isar isar = await _db;
    Query<Account> accountsQuery = isar.accounts.where().build();

    yield* accountsQuery.watch(fireImmediately: true);
  }
}