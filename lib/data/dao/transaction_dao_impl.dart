import 'dart:async';

import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class TransactionDaoImpl extends TransactionDao {
  static final TransactionDaoImpl _transactionDaoImpl = TransactionDaoImpl._internal();

  factory TransactionDaoImpl() {
    return _transactionDaoImpl;
  }

  TransactionDaoImpl._internal() {
    _setUpWatchers();
  }

  final _logger = getLogger('TransactionDaoImpl');

  final _transactionStreamController = StreamController<List<Transaction>>.broadcast();
  final _recentTransactionStreamController = StreamController<List<Transaction>>.broadcast();

  Future<Isar> get _db async => await IsarDatabase.instance.database;

  void _setUpWatchers() async {
    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final accountsCollection = isar.accounts;
    final categoriesCollection = isar.categorys;

    final transactionsStream = transactionCollection.watchLazy(fireImmediately: true);
    final accountsStream = accountsCollection.watchLazy(fireImmediately: true);
    final categoriesStream = categoriesCollection.watchLazy(fireImmediately: true);

    transactionsStream.listen((_) async {
      _transactionStreamController.sink.add(await getTransactions());
      _recentTransactionStreamController.sink.add(await getRecentTransactions());
    });

    accountsStream.listen((_) async {
      _transactionStreamController.sink.add(await getTransactions());
      _recentTransactionStreamController.sink.add(await getRecentTransactions());
    });

    categoriesStream.listen((_) async {
      _transactionStreamController.sink.add(await getTransactions());
      _recentTransactionStreamController.sink.add(await getRecentTransactions());
    });
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final createdTransaction = await isar.writeTxn(() async {
      final id = await transactionCollection.put(transaction);

      await transaction.account.save();
      await transaction.category.save();

      final savedTransaction = await transactionCollection.get(id);
      return savedTransaction;
    });

    return createdTransaction!;
  }

  @override
  Future<List<Transaction>> createTransactions(List<Transaction> transactions) async {
    _logger.i('argument: $transactions');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final createdTransactions = await isar.writeTxn(() async {
      final ids = await transactionCollection.putAll(transactions);

      await Future.forEach(transactions, (Transaction t) async {
        await t.account.save();
        await t.destinationAccount.save();
        await t.category.save();
      });

      return await transactionCollection.getAll(ids);
    });

    return createdTransactions.cast<Transaction>();
  }

  @override
  Future<Transaction> getTransactionById(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final transaction = await isar.writeTxn(() async {
      return transactionCollection.get(id);
    });

    transaction!.account.load();
    transaction.category.load();
    transaction.destinationAccount.load();

    return transaction;
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    _logger.i('argument: NONE');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    List<Transaction> transactions =
        await transactionCollection.where().sortByDateDesc().build().findAll();

    for (Transaction t in transactions) {
      t.account.load();
      t.category.load();
      t.destinationAccount.load();
    }

    return transactions;
  }

  @override
  Future<List<Transaction>> getRecentTransactions() async {
    _logger.i('argument: NONE');
    final transactions = await getTransactions();

    final filteredTransactions = transactions.where((t) {
      t.account.loadSync();
      final isAccountSelected = t.account.value?.isSelected ?? false;

      return isAccountSelected;
    });

    final recentTransactions = filteredTransactions.take(5).toList();

    return Future.value(recentTransactions);
  }

  @override
  Future<List<Transaction>> getTransactionsByTransferId(String transferId) async {
    _logger.i('argument: $transferId');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    List<Transaction> transactions =
        await transactionCollection.filter().transferIdEqualTo(transferId).build().findAll();

    for (Transaction t in transactions) {
      t.account.load();
      t.category.load();
      t.destinationAccount.load();
    }

    return transactions;
  }

  @override
  Future<Transaction> updateTransaction(Transaction transaction) async {
    _logger.i('argument: $transaction');

    Isar isar = await _db;

    final transactionCollection = isar.transactions;
    final updatedTransaction = await isar.writeTxn(() async {
      await transactionCollection.put(transaction);

      await transaction.account.save();
      await transaction.destinationAccount.save();
      await transaction.category.save();

      return transaction;
    });

    return updatedTransaction;
  }

  @override
  Future<Id> deleteTransaction(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;
    final transactionCollection = isar.transactions;
    final isDeleted = await isar.writeTxn(() async {
      return await transactionCollection.delete(id);
    });

    return isDeleted ? id : -1;
  }

  @override
  Future<int> deleteTransactionsByTransferId(String transferId) async {
    _logger.i('argument: $transferId');

    Isar isar = await _db;
    final transactionCollection = isar.transactions;
    final deleteCount = await isar.writeTxn(() async {
      return await transactionCollection.filter().transferIdEqualTo(transferId).deleteAll();
    });

    return deleteCount;
  }

  @override
  Future<int> deleteTransactions(List<int> ids) async {
    _logger.i('argument: $ids');

    Isar isar = await _db;
    final transactionCollection = isar.transactions;
    final deleteCount = await isar.writeTxn(() async {
      return await transactionCollection.deleteAll(ids);
    });

    return deleteCount;
  }

  @override
  Stream<List<Transaction>> transactionCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* _transactionStreamController.stream;
  }

  @override
  Stream<List<Transaction>> recentTransactionCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* _recentTransactionStreamController.stream;
  }

  void dispose() {
    _logger.i('Disposing TransactionDaoImpl');
    _transactionStreamController.close();
  }
}
