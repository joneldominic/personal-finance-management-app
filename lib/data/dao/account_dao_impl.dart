import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class AccountDaoImpl extends AccountDao {
  Future<Isar> get _db async => await IsarDatabase.instance.database;

  @override
  Future<Account> createAccount(Account account) async {
    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final createdAccount = await isar.writeTxn(() async {
      final id = await accountCollection.put(account);
      return await accountCollection.get(id);
    });

    return createdAccount!;
  }

  @override
  Future<Account> getAccountById(Id id) {
    // TODO: implement getAccountById
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getAccounts() async {
    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final createdAccount = await isar.writeTxn(() async {
      return await accountCollection.where().findAll();
    });

    return createdAccount;
  }

  @override
  Future<Account> updateAccount(Account account) async {
    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final updatedAccount = await isar.writeTxn(() async {
      await accountCollection.put(account);
      return account;
    });

    return updatedAccount;
  }

  @override
  Future<Id> deleteAccount(Id id) async {
    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final isDeleted = await isar.writeTxn(() async {
      return await accountCollection.delete(id);
    });

    return isDeleted ? id : -1;
  }

  @override
  Stream<List<Account>> accountCollectionStream() async* {
    Isar isar = await _db;

    final accountCollection = isar.accounts;
    Query<Account> accountsQuery = accountCollection.where().build();

    yield* accountsQuery.watch(fireImmediately: true);
  }
}
