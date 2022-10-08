import 'package:personal_finance_management_app/data/dao/account_dao_impl.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/repositories/account_repository.dart';
import 'package:stacked/stacked.dart';

class AccountService with ReactiveServiceMixin {
  final _accountRepository = AccountRepository(accountDao: AccountDaoImpl());

  Future<Account> createAccount(Account account) async {
    return _accountRepository.createAccount(account);
  }

  Future<List<Account>> getAccounts() async {
    return _accountRepository.getAccounts();
  }

  Stream<List<Account>> accountCollectionStream() async* {
    yield* _accountRepository.accountCollectionStream();
  }
}
