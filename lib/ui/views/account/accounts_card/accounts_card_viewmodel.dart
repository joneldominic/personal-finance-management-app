import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/core/enums/dialog_type.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:personal_finance_management_app/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class AccountsCardViewModel extends BaseViewModel {
  final _logger = getLogger('AccountsCardViewModel');
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();
  final _dialogService = locator<DialogService>();
  final _transactionService = locator<TransactionService>();

  bool _isMultiSelect = false;

  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

  void navigateToAccountSettings() {
    _logger.i('argument: NONE');
    _navigationService.navigateToAccountSettingsView();
  }

  void navigateToAccountDetail() {
    _logger.i('argument: NONE');
    _navigationService.navigateToAccountDetailView();
  }

  void selectAccount(Account account) {
    _logger.i('argument: $account');

    _isFiltered = true;
    notifyListeners();

    _accountService.selectAccount(account, multi: _isMultiSelect);
  }

  void multiSelectAccount(Account account) {
    _logger.i('argument: $account');

    _isMultiSelect = true;
    _isFiltered = true;
    notifyListeners();

    _accountService.selectAccount(account, multi: _isMultiSelect);
  }

  void clearFilter() {
    _logger.i('argument: NONE');

    _isMultiSelect = false;
    _isFiltered = false;
    notifyListeners();

    _accountService.selectAllAccounts();
  }

  void handUpdateBalance() async {
    _logger.i('argument: NONE');

    final selectedAccount = await _accountService.getFirstSelectedAccount();
    if (selectedAccount == null) return;

    final response = await _dialogService.showCustomDialog(
      variant: DialogType.updateBalanceDialog,
      data: selectedAccount,
    );

    if (response == null) {
      _logger.w("Account Balance Update Cancelled");
      return;
    }

    if (response.confirmed) {
      _logger.i("New Account Balance: ${response.data}");

      final newBalance = response.data;
      final isEqual = selectedAccount.balance == newBalance;

      if (isEqual) return;

      final account = Account.clone(selectedAccount)
        ..id = selectedAccount.id
        ..balance = newBalance;
      final updatedAccount = await _accountService.updateAccount(account);
      _logger.i('Account Updated Successfully: $updatedAccount');

      final balanceDiff = doubleToCurrencyFormatter(
        currency: selectedAccount.currency ?? "₱",
        value: (selectedAccount.balance! - newBalance) * -1,
      );
      await handleConfirmTransactionCreation(selectedAccount, balanceDiff);
    }
  }

  Future<void> handleConfirmTransactionCreation(Account account, String balanceDiff) async {
    _logger.i('argument: $balanceDiff');

    final response = await _dialogService.showCustomDialog(
      variant: DialogType.balanceUpdateConfirmation,
      data: balanceDiff,
    );

    if (response == null) {
      _logger.w("Account Balance Cancelled");
      return;
    }

    if (response.confirmed) {
      final savedTransaction = await _transactionService.createTransactionFromAccountBalanceDiff(
        account,
        balanceDiff,
      );
      _logger.i("Account Balance Updated with Transaction: $savedTransaction");
      return;
    }

    _logger.i("Account Balance Updated without Transaction");
  }
}
