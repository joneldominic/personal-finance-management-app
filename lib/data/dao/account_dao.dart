import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

abstract class AccountDao {
  Future<Account> createAccount(Account account);
  Future<Account> getAccountById(Id id);
  Future<List<Account>> getAccounts();
  Future<List<Account>> getSelectedAccounts();
  Future<Account> updateAccount(Account account);
  Future<Account> singleSelectAccount(Account account);
  Future<List<Account>> selectAllAccounts();
  Future<Id> deleteAccount(Id id);
  Stream<List<Account>> accountCollectionStream();
  Stream<double> accountBalanceStream();
}
