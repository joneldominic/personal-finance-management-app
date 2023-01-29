import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class AccountDaoImpl extends AccountDao {
  final _logger = getLogger('AccountDaoImpl');

  Future<Isar> get _db async => await IsarDatabase.instance.database;

  @override
  Future<Account> createAccount(Account account) async {
    _logger.i('argument: $account');

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
    _logger.i('argument: $id');

    // TODO: implement getAccountById
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getAccounts() async {
    _logger.i('argument: NONE');

    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final accounts = await isar.writeTxn(() async {
      return await accountCollection.where().findAll();
    });

    return accounts;
  }

  @override
  Future<Account> updateAccount(Account account) async {
    _logger.i('argument: $account');

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
    _logger.i('argument: $id');

    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final transactionCollection = isar.transactions;

    final isDeleted = await isar.writeTxn(() async {
      final account = await accountCollection.get(id);

      await account!.transactions.load();
      final transactionsIds = account.transactions.map((t) => t.id).toList();
      await transactionCollection.deleteAll(transactionsIds);

      return await accountCollection.delete(id);
    });

    return isDeleted ? id : -1;
  }

  @override
  Stream<List<Account>> accountCollectionStream() async* {
    _logger.i('argument: NONE');

    Isar isar = await _db;

    final accountCollection = isar.accounts;
    Query<Account> accountsQuery = accountCollection.where().build();

    yield* accountsQuery.watch(fireImmediately: true);
  }
}
