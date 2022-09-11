import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/account_enum.dart';
import 'package:personal_finance_management_app/ui/views/account/account_details/account_details_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class AccountDetailsViewModel extends FormViewModel {
  final _logger = getLogger("AccountDetailsViewModel");
  final _navigationService = locator<NavigationService>();

  TextEditingController? _balanceController;
  TextEditingController? _newBalanceController;

  BalanceUpdateType balanceUpdateType = BalanceUpdateType.withRecord;
  bool newBalanceFormIsVisible = false;
  bool isExcludeFromAnalysis = false;
  bool isArchivedAccount = false;

  void initForm({
    required TextEditingController accountNameController,
    required TextEditingController balanceController,
    required TextEditingController newBalanceController,
  }) {
    setColor('0xFFFF4081');
    setCurrency('PHP');

    _balanceController = balanceController;
    _newBalanceController = newBalanceController;

    accountNameController.text = "Cash";
    balanceController.text = "1,000.00";
  }

  void popCurrentView() => _navigationService.popRepeated(1);

  void setBalanceUpdateType(BalanceUpdateType? newBalanceUpdateType) {
    balanceUpdateType = newBalanceUpdateType!;
    notifyListeners();
  }

  void setNewBalanceFormVisibility(bool isVisible) {
    newBalanceFormIsVisible = isVisible;
    _newBalanceController!.text = _balanceController!.text;
    notifyListeners();
  }

  void setIsExcludeFromAnalysis(bool isExcluded) {
    isExcludeFromAnalysis = isExcluded;
    notifyListeners();
  }

  void setIsArchivedAccount(bool isArchived) {
    isArchivedAccount = isArchived;
    notifyListeners();
  }

  @override
  void setFormStatus() {}
}
