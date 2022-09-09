import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/ui/views/account/account_details/account_details_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class AccountDetailsViewModel extends FormViewModel {
  final _logger = getLogger("AccountDetailsViewModel");

  final _navigationService = locator<NavigationService>();

  void initForm({
    required TextEditingController accountNameController,
    required TextEditingController balanceController,
  }) {
    // TODO: initialize data here
    setColor('0xff74fe07');
    setCurrency('PHP');
    accountNameController.text = "Cash";
    balanceController.text = "1,000.00";
  }

  void popCurrentView() => _navigationService.popRepeated(1);

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
    _logger.i('Set form value with data: $formValueMap');
  }
}
