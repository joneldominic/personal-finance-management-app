import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/account_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

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

    // TODO: Handle transactions with deleted destination account
    // TODO: Probably convert/retain the expense pair only and convert the transaction type as expense with undefined category
    // TODO: Or maybe just delete pair???
    // TODO: Wallet Budget Backers Approach
    /* 
      Created Account: Cash = 0 Balance
      Created Account: BPI = 20,000 Balance

      Add transfer transaction from BPI -> Cash (5,000)
        Transactions 
          BPI -> Cash (-5,000)      BPI Transaction
          BPI -> Cash (5,000)       Cash Transaction

      Delete Account: BPI (Source)
        Transaction
          Outside of Wallet -> Cash (5,000)

      or

      Delete Account: Cash (Destination)
        Transaction
          BPI -> Outside of Wallet (-5,000)
     */

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
