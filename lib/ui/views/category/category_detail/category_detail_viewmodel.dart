import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/account_enum.dart';
import 'package:personal_finance_management_app/ui/views/category/category_detail/category_detail_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class CategoryDetailViewModel extends FormViewModel {
  final _logger = getLogger("CategoryDetailViewModel");
  final _navigationService = locator<NavigationService>();

  TextEditingController? _balanceController;
  TextEditingController? _newBalanceController;

  BalanceUpdateType balanceUpdateType = BalanceUpdateType.withRecord;
  bool categoryIsVisible = false;

  void initForm({
    required TextEditingController accountNameController,
    required TextEditingController balanceController,
    required TextEditingController newBalanceController,
  }) {
    _logger.i(
        'initForm | argument: {accountNameController: $accountNameController, balanceController: $balanceController, newBalanceController: $newBalanceController}');

    setColor('0xFFFF4081');
    // setCategoryNature(categoryNature) // TODO: Set to None Initially

    // TODO: Set and Init Controllers
    _balanceController = balanceController;
    _newBalanceController = newBalanceController;

    accountNameController.text = "Cash";
    balanceController.text = "1,000.00";
  }

  void popCurrentView() {
    _logger.i('popCurrentView | argument: NONE');
    _navigationService.popRepeated(1);
  }

  void setCategoryVisibility(bool isVisible) {
    _logger.i('setCategoryVisibility | argument: $isVisible');
    categoryIsVisible = isVisible;
    notifyListeners();
  }

  @override
  void setFormStatus() {}
}