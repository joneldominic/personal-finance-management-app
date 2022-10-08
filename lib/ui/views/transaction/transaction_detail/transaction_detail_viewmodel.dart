import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class TransactionDetailViewModel extends FormViewModel {
  final _logger = getLogger('TransactionDetailViewModel');
  final _navigationService = locator<NavigationService>();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final List<String> dummyAccounts = ['Cash', 'GCash', 'BPI'];
  final List<String> dummyCategory = [
    'Foods',
    'Shopping',
    'Transportation',
    'House Bills'
  ];

  void initForm() {
    _logger.i('argument: NONE');

    initDateTimeFields();

    setAccountName(dummyAccounts[0]);
    setCategory(dummyCategory[0]);
  }

  void initDateTimeFields() {
    _logger.i('argument: NONE');

    final DateTime now = DateTime.now();
    final String date = DateFormat('MMM dd, yyyy').format(now);
    final String time = DateFormat('hh:mm a').format(now);

    dateController.text = date;
    timeController.text = time;
  }

  void popCurrentView() {
    _logger.i('argument: NONE | Navigation Pop: 1');
    _navigationService.popRepeated(1);
  }

  void setTransactionDate(BuildContext context) async {
    _logger.i('argument: $context');

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      dateController.text = DateFormat('MMM dd, yyyy').format(selectedDate);
    }
  }

  void setTransactionTime(BuildContext context) async {
    _logger.i('argument: $context');

    final DateTime now = DateTime.now();

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );

    if (selectedTime != null) {
      final String time = DateFormat('hh:mm a').format(DateTime(now.year,
          now.month, now.day, selectedTime.hour, selectedTime.minute));
      timeController.text = time;
    }
  }

  @override
  void setFormStatus() {}
}
