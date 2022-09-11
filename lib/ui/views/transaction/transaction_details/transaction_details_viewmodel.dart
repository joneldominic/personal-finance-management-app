import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/account_enum.dart';
import 'package:personal_finance_management_app/ui/views/account/account_details/account_details_view.form.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_details/transaction_details_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class TransactionDetailsViewModel extends FormViewModel {
  final _logger = getLogger("AccountDetailsViewModel");
  final _navigationService = locator<NavigationService>();

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void setTransactionDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      // TODO: Improve Date Formatting
      dateController.text =
          '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';
    }
  }

  void setTransactionTime(BuildContext context) async {
    final DateTime now = DateTime.now();

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );

    if (selectedTime != null) {
      // TODO: Improve Time Formatting
      timeController.text = '${selectedTime.hour}:${selectedTime.minute}';
    }
  }

  // --------------------------------------------------------------------
  // TODO: Remove unnecessary codes

  TextEditingController? _newBalanceController;

  BalanceUpdateType balanceUpdateType = BalanceUpdateType.withRecord;
  bool newBalanceFormIsVisible = false;
  bool isExcludeFromAnalysis = false;
  bool isArchivedAccount = false;

  // TODO: Initialize date and time
  void initForm({
    required TextEditingController accountNameController,
    required TextEditingController balanceController,
    required TextEditingController newBalanceController,
  }) {
    _logger.i(
        'initForm | argument: {accountNameController: $accountNameController, balanceController: $balanceController, newBalanceController: $newBalanceController}');

    setColor('0xFFFF4081');
    setCurrency('PHP');

    _newBalanceController = newBalanceController;

    accountNameController.text = "Cash";
    balanceController.text = "1,000.00";
  }

  void popCurrentView() {
    _logger.i('popCurrentView | argument: NONE');
    _navigationService.popRepeated(1);
  }

  void setBalanceUpdateType(BalanceUpdateType? newBalanceUpdateType) {
    _logger.i('setBalanceUpdateType | argument: $newBalanceUpdateType');
    balanceUpdateType = newBalanceUpdateType!;
    notifyListeners();
  }

  void setNewBalanceFormVisibility(bool isVisible) {
    _logger.i('setNewBalanceFormVisibility | argument: $isVisible');
    newBalanceFormIsVisible = isVisible;
    notifyListeners();
  }

  void setIsExcludeFromAnalysis(bool isExcluded) {
    _logger.i('setIsExcludeFromAnalysis | argument: $isExcluded');
    isExcludeFromAnalysis = isExcluded;
    notifyListeners();
  }

  void setIsArchivedAccount(bool isArchived) {
    _logger.i('setIsArchivedAccount | argument: $isArchived');
    isArchivedAccount = isArchived;
    notifyListeners();
  }

  @override
  void setFormStatus() {}
}
