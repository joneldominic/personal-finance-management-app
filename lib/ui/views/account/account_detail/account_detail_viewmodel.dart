import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/account_enum.dart';
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

  TextEditingController? _accountNameController;
  TextEditingController? _balanceController;
  TextEditingController? _newBalanceController;

  BalanceUpdateType balanceUpdateType = BalanceUpdateType.withRecord;
  bool newBalanceFormIsVisible = false;
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
    _newBalanceController = newBalanceController;

    setColor(account?.color ?? '0xFFFF4081');
    setCurrency(account?.currency ?? 'PHP');
    accountNameController.text = account?.name ?? 'Cash';
    balanceController.text = account?.balance.toString() ?? '0';
    isExcludeFromAnalysis = account?.isExcludedFromAnalysis ?? false;
    isArchivedAccount = account?.isArchived ?? false;
  }

  void popCurrentView() {
    _logger.i('argument: NONE | Navigation Pop: 1');
    _navigationService.popRepeated(1);
  }

  void setBalanceUpdateType(BalanceUpdateType? newBalanceUpdateType) {
    _logger.i('argument: $newBalanceUpdateType');
    balanceUpdateType = newBalanceUpdateType!;
    notifyListeners();
  }

  void setNewBalanceFormVisibility(bool isVisible) {
    _logger.i('argument: $isVisible');
    newBalanceFormIsVisible = isVisible;
    _newBalanceController!.text = _balanceController!.text;
    notifyListeners();
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

  void saveAccount(Account? account) async {
    _logger.i('argument: $account');

    final newAccount = Account(
      name: _accountNameController!.text,
      currency: currencyValue,
      balance: double.parse(_balanceController!.text),
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
