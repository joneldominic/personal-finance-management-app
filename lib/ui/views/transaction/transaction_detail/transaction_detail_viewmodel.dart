import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/extensions/list_extension.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:personal_finance_management_app/services/transaction_service.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class TransactionDetailViewModel extends FormViewModel {
  final _logger = getLogger('TransactionDetailViewModel');
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();
  final _transactionService = locator<TransactionService>();
  final _snackbarService = locator<SnackbarService>();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  CurrencyInputFormatter currencyInputFormatter = CurrencyInputFormatter(
    symbol: "PHP",
    allowNegative: false,
  );
  TextEditingController? _amountController;
  TextEditingController? _notesController;

  String get emptyAccountErrorMessage =>
      "No account available. Please create one";

  final List<String> dummyCategory = [
    'Foods',
    'Shopping',
    'Transportation',
    'House Bills'
  ];

  List<Account> accounts = [];

  void initForm({
    required TextEditingController amountController,
    required TextEditingController notesController,
  }) async {
    _logger.i(
      'argument: {amountController: $amountController, notesController: $notesController',
    );

    await initData();

    setAccountId(accounts.isNotEmpty ? accounts[0].id.toString() : "");

    setTransactionType('expense');

    currencyInputFormatter = CurrencyInputFormatter(
      symbol: accounts.isNotEmpty ? accounts[0].currency! : "PHP",
      allowNegative: false,
    );
    _amountController = amountController;
    amountController.text = currencyInputFormatter.reformat('0');

    setCategory(dummyCategory[0]); // TODO: Implement category data

    initDateTimeFields();

    _notesController = notesController;
    notesController.text = ''; // TODO: handle update mode
  }

  Future<void> initData() async {
    _logger.i('argument: NONE');
    accounts = await _accountService.getAccounts();
    _logger.i('accounts: ${accounts.itemsToString()}');

    // TODO: Add all data fetching here
  }

  void initDateTimeFields() {
    _logger.i('argument: NONE');

    // TODO: Handle date time on edit
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

  void handleAccountChange(String accountId) {
    Account account = accounts.firstWhere(
      (acc) => acc.id == int.parse(accountId),
    );
    setAccountId(account.id.toString());
    currencyInputFormatter =
        CurrencyInputFormatter(symbol: account.currency!, allowNegative: false);
    _amountController!.text =
        currencyInputFormatter.reformat(_amountController!.text);
  }

  void handleTransactionTypeChange(String transactionType) {
    setTransactionType(transactionType);

    double amount = double.parse(
      _amountController!.text.replaceAll(RegExp(r'[^0-9-.]+'), ''),
    );

    if (transactionType == "expense") {
      amount = amount.abs() * -1;
    } else if (transactionType == "income") {
      amount = amount.abs();
    }

    _amountController!.text =
        currencyInputFormatter.reformat(amount.toString());

    // TODO: Show Transfer distination if type is transfer
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

  void saveTransaction() {
    _logger.i('argument: NONE');

    final amount = double.parse(
      _amountController!.text.replaceAll(RegExp(r'[^0-9-.]+'), ''),
    );

    if (amount == 0) {
      handleShowSnackbar(message: "Please enter an amount not equal to zero");
      return;
    }

    _logger.e("accountIdValue: $accountIdValue");
    _logger.e("transactionTypeValue: $transactionTypeValue");
    _logger.e("amount: ${double.parse(
      _amountController!.text.replaceAll(RegExp(r'[^0-9-.]+'), ''),
    )}");
    _logger.e("category: $categoryValue");
    _logger.e("date: ${dateController.text}");
    _logger.e("time: ${timeController.text}");
    _logger.e("notes: ${_notesController!.text}");

    DateTime tmpDate = DateFormat("MMM dd, yyyy - hh:mm a")
        .parse("${dateController.text} - ${timeController.text}");
    String tmpD = DateFormat('MMM dd, yyyy').format(tmpDate);
    String tmpT = DateFormat('hh:mm a').format(tmpDate);

    _logger.e("parsed date: $tmpDate");
    _logger.e("tmpDate: $tmpD");
    _logger.e("tmpTime: $tmpT");

    final date = DateFormat("MMM dd, yyyy - hh:mm a")
        .parse("${dateController.text} - ${timeController.text}");

    // TODO: Pop view on save

    // TODO: Handle if 0 -> show snackbar

    final newTransaction = Transaction(
      accountId: int.parse(accountIdValue!),
      transactionType: transactionTypeValue,
      amount: amount,
      category: categoryValue,
      date: date,
      notes: _notesController!.text,
    );

    _transactionService.createTransaction(newTransaction);
    // TODO: Adjust balance as well

    _logger.i('Navigation Pop: 1');
    _navigationService.popRepeated(1);
  bool showNegativeAmountPrefix() {
    final amount = double.parse(
      _amountController?.text.replaceAll(RegExp(r'[^0-9-.]+'), '') ?? "0",
    );

    if (amount == 0) {
      return false;
    }

    return transactionTypeValue ==
        EnumToString.convertToString(TransactionType.expense);
  }
  }

  void handleShowSnackbar({required String message}) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.main,
      message: message,
      duration: const Duration(seconds: 2),
      onTap: () {},
    );
  }

  @override
  void setFormStatus() {}
}
