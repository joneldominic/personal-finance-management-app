import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/balance_update_type.dart';
import 'package:personal_finance_management_app/core/enums/dialog_type.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:personal_finance_management_app/ui/views/account/account_detail/account_detail_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class AccountDetailViewModel extends FormViewModel {
  final _logger = getLogger('AccountDetailViewModel');
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();
  final _dialogService = locator<DialogService>();

  TextEditingController? _accountNameController;
  TextEditingController? _balanceController;
  // TextEditingController? _newBalanceController;

  CurrencyInputFormatter? currencyInputFormatter;

  BalanceUpdateType balanceUpdateType = BalanceUpdateType.withRecord;
  // bool newBalanceFormIsVisible = false;
  bool isExcludeFromAnalysis = false;
  bool isArchivedAccount = false;

  void initForm({
    required Account? account,
    required TextEditingController accountNameController,
    required TextEditingController balanceController,
    required TextEditingController newBalanceController,
  }) {
    _logger.i(
      'argument: {accountNameController: $account, $accountNameController, balanceController: $balanceController, newBalanceController: $newBalanceController}',
    );

    _accountNameController = accountNameController;
    _balanceController = balanceController;
    // _newBalanceController = newBalanceController;

    setColor(account?.color ?? '0xFFFF4081');
    setCurrency(account?.currency ?? 'PHP');
    currencyInputFormatter =
        CurrencyInputFormatter(symbol: account?.currency ?? "PHP");
    accountNameController.text = account?.name ?? '';
    balanceController.text =
        currencyInputFormatter!.reformat(account?.balance.toString() ?? '0');
    isExcludeFromAnalysis = account?.isExcludedFromAnalysis ?? false;
    isArchivedAccount = account?.isArchived ?? false;
  }

  void popCurrentView() {
    _logger.i('argument: NONE | Navigation Pop: 1');
    _navigationService.popRepeated(1);
  }

  void setIsExcludeFromAnalysis(bool isExcluded) {
    _logger.i('argument: $isExcluded');
    isExcludeFromAnalysis = isExcluded;
    notifyListeners();
  }

  void setIsArchivedAccount(bool isArchived) {
    _logger.i('argument: $isArchived');
    isArchivedAccount = isArchived;
    notifyListeners();
  }

  void setAccountCurrency(String currency) {
    setCurrency(currency);
    currencyInputFormatter = CurrencyInputFormatter(symbol: currency);
    _balanceController!.text =
        currencyInputFormatter!.reformat(_balanceController!.text);
  }

  void saveAccount(Account? account) async {
    _logger.i('argument: $account');

    // TODO: Add validation, show error message if empty

    final balance = double.parse(
      _balanceController!.text.replaceAll(RegExp(r'[^0-9-.]+'), ''),
    );

    if (account != null && account.balance != balance) {
      _logger.i("Showing BalanceConfirmationDialog");
      final balanceDiff = doubleToCurrencyFormatter(
        currency: account.currency ?? "PHP",
        value: (account.balance! - balance) * -1,
      );
      final response = await _dialogService.showCustomDialog(
          variant: DialogType.balanceUpdateConfirmation, data: balanceDiff);

      if (response == null) {
        _logger.w("Save Account Cancelled");
        return;
      }

      if (response.confirmed) {
        // TODO: Create a transaction record
        _logger.e("Should create a transaction record");
      }

      _logger.i("BalanceConfirmationDialog Closed");
    }

    final newAccount = Account(
      name: _accountNameController!.text,
      currency: currencyValue,
      balance: balance,
      color: colorValue,
      isExcludedFromAnalysis: isExcludeFromAnalysis,
      isArchived: isArchivedAccount,
    );

    if (account != null) {
      newAccount.id = account.id;
      final updatedAccount = await _accountService.updateAccount(newAccount);
      _logger.i('Account Updated Successfully: $updatedAccount');
    } else {
      final addedAccount = await _accountService.createAccount(newAccount);
      _logger.i('Account Saved Successfully: $addedAccount');
    }

    _logger.i('Navigation Pop: 1');
    _navigationService.popRepeated(1);
  }

  void deleteAccount(Account account) async {
    // TODO: Add confirmation dialog

    final deletedId = await _accountService.deleteAccount(account.id);

    if (deletedId == -1) {
      _logger.e("Account Deletion Failed!");
      // TODO: Handle failure (Toast/Snackbar)
    }

    _logger.i('Navigation Pop: 1');
    _navigationService.popRepeated(1);
  }

  @override
  void setFormStatus() {}
}
