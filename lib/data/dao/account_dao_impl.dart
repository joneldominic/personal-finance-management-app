import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class AccountDaoImpl extends AccountDao {
  static final AccountDaoImpl _accountDaoImpl = AccountDaoImpl._internal();

  factory AccountDaoImpl() {
    return _accountDaoImpl;
  }

  AccountDaoImpl._internal();

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
  Future<Account> getAccountById(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final account = await isar.writeTxn(() async {
      return await accountCollection.get(id);
    });

    return account!;
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
  Future<List<Account>> getSelectedAccounts() async {
    _logger.i('argument: NONE');

    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final selectedAccounts = await isar.writeTxn(() async {
      return await accountCollection.filter().isSelectedEqualTo(true).findAll();
    });

    return selectedAccounts;
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
  Future<Account> singleSelectAccount(Account account) async {
    _logger.i('argument: $account');

    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final selectedAccount = await isar.writeTxn(() async {
      final selectedAccounts = await accountCollection.filter().isSelectedEqualTo(true).findAll();
      for (Account a in selectedAccounts) {
        a.isSelected = false;
      }
      await accountCollection.putAll(selectedAccounts);

      account.isSelected = true;
      await accountCollection.put(account);

      return account;
    });

    return selectedAccount;
  }

  @override
  Future<List<Account>> selectAllAccounts() async {
    _logger.i('argument: NONE');

    Isar isar = await _db;

    final accountCollection = isar.accounts;
    final selectedAccounts = await isar.writeTxn(() async {
      final accounts = await accountCollection.where().findAll();
      for (Account a in accounts) {
        a.isSelected = true;
      }

      await accountCollection.putAll(accounts);
      return accounts;
    });

    return selectedAccounts;
  }

  @override
  Future<Id> deleteAccount(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;

    final accountCollection = isar.accounts;

    final isDeleted = await isar.writeTxn(() async {
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
