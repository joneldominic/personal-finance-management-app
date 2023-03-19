import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/dao/account_dao_impl.dart';
import 'package:personal_finance_management_app/data/dao/transaction_dao_impl.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/repositories/account_repository.dart';
import 'package:stacked/stacked.dart';

class AccountService with ReactiveServiceMixin {
  final _logger = getLogger('AccountService');
  final _accountRepository = AccountRepository(
    accountDao: AccountDaoImpl(),
    transactionDao: TransactionDaoImpl(),
  );

  Future<Account?> initAccount() {
    _logger.i('argument: NONE');

    final defaultAccount = Account(
      name: DEFAULT_ACCOUNT_NAME,
      balance: 0,
      color: DEFAULT_ACCOUNT_COLOR,
      currency: DEFAULT_ACCOUNT_CURRENCY,
      isArchived: false,
      isExcludedFromAnalysis: false,
      isDefault: true,
    );

    return _accountRepository.createAccount(defaultAccount);
  }

  Future<Account> createAccount(Account account) async {
    _logger.i('argument: $account');
    return _accountRepository.createAccount(account);
  }

  Future<Account> updateAccount(Account account) async {
    _logger.i('argument: $account');
    return _accountRepository.updateAccount(account);
  }

  Future<Account> selectAccount(Account account, {bool multi = false}) async {
    _logger.i('argument: $account, {multi: $multi}');
    return _accountRepository.selectAccount(account, multi: multi);
  }

  Future<List<Account>> selectAllAccounts() {
    _logger.i('argument: NONE');
    return _accountRepository.selectAllAccounts();
  }

  Future<Id> deleteAccount(Id id) async {
    _logger.i('argument: $id');
    return _accountRepository.deleteAccount(id);
  }

  Future<List<Account>> getAccounts() async {
    _logger.i('argument: NONE');
    return _accountRepository.getAccounts();
  }

  Future<Account?> getFirstSelectedAccount() {
    _logger.i('argument: NONE');
    return _accountRepository.getFirstSelectedAccount();
  }

  Stream<List<Account>> accountCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* _accountRepository.accountCollectionStream();
  }

  Stream<double> accountBalanceStream() async* {
    _logger.i('argument: NONE');
    yield* _accountRepository.accountBalanceStream();
  }
}
