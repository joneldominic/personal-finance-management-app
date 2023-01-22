import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/core/utils/string_helpers.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/extensions/list_extension.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:personal_finance_management_app/services/category_service.dart';
import 'package:personal_finance_management_app/services/transaction_service.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class TransactionDetailViewModel extends FormViewModel {
  final _logger = getLogger('TransactionDetailViewModel');
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();
  final _transactionService = locator<TransactionService>();
  final _categoryService = locator<CategoryService>();
  final _snackbarService = locator<SnackbarService>();

  Transaction? _transaction;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final FocusNode amountFieldFocusNode = FocusNode();
  final FocusNode destinationAccountFocusNode = FocusNode();

  CurrencyInputFormatter currencyInputFormatter = CurrencyInputFormatter(
    symbol: "PHP",
    allowNegative: false,
  );
  TextEditingController? _amountController;
  TextEditingController? _notesController;

  String get emptyAccountErrorMessage => "No account available";
  String get emptyCategoryErrorMessage => "No category available";

  bool get disableSave =>
      accounts.isEmpty ||
      categories.isEmpty ||
      transactionTypeValue ==
              EnumToString.convertToString(TransactionType.transfer) &&
          destinationAccounts.isEmpty;

  List<Account> accounts = [];
  List<Account> destinationAccounts = [];
  List<Category> categories = [];

  void initForm({
    required Transaction? transaction,
    required TextEditingController amountController,
    required TextEditingController notesController,
  }) async {
    _logger.i(
      'argument: {transaction: $transaction, amountController: $amountController, notesController: $notesController}',
    );

    _transaction = transaction;
    _logger.e(transaction);

    await initData();
    filterDestinationAccount();

    setAccountId(
      accounts.isNotEmpty
          ? transaction?.accountId.toString() ?? accounts[0].id.toString()
          : "",
    );

    setTransactionType(
      EnumToString.convertToString(
        transaction?.transactionType ?? TransactionType.expense,
      ),
    );

    if (transaction?.transactionType == TransactionType.transfer &&
        transaction?.destinationAccountId != null) {
      setDestinationAccountId(transaction!.destinationAccountId.toString());
    }

    // TODO: Handle if account was already deleted
    Account? account =
        accounts.firstWhereOrNull((acc) => acc.id == transaction?.accountId);
    currencyInputFormatter = CurrencyInputFormatter(
      symbol: accounts.isNotEmpty
          ? account?.currency ?? accounts[0].currency!
          : "PHP",
      allowNegative: false,
    );
    _amountController = amountController;
    amountController.text = currencyInputFormatter.reformat('0');

    setCategoryId(
      categories.isNotEmpty
          ? transaction?.categoryId.toString() ?? categories[1].id.toString()
          : '',
    ); // TODO: handle if category was already deleted

    initDateTimeFields(transaction?.date);

    _notesController = notesController;
    notesController.text = transaction?.notes ?? '';
  }

  Future<void> initData() async {
    _logger.i('argument: NONE');

    accounts = await _accountService.getAccounts();
    _logger.i('accounts: ${accounts.itemsToString()}');

    categories = await _categoryService.getCategories();
    _logger.i('categories: ${categories.itemsToString()}');
  }

  void initDateTimeFields(DateTime? dateTime) {
    _logger.i('argument: $dateTime');

    final DateTime now = dateTime ?? DateTime.now();
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
    _logger.i('argument: $accountId');

    setAccountId(accountId);

    Account account = accounts.firstWhere(
      (acc) => acc.id == int.parse(accountId),
    );
    currencyInputFormatter =
        CurrencyInputFormatter(symbol: account.currency!, allowNegative: false);
    _amountController!.text =
        currencyInputFormatter.reformat(_amountController!.text);

    filterDestinationAccount();
  }

  void handleDestinationAccountChange(String accountId) {
    _logger.i('argument: $accountId');
    setDestinationAccountId(accountId);
  }

  void handleTransactionTypeChange(String transactionType) {
    _logger.i('argument: $transactionType');

    setTransactionType(transactionType);

    if (transactionType ==
        EnumToString.convertToString(TransactionType.transfer)) {
      filterDestinationAccount();
    }
  }

  void setTransactionDate(BuildContext context) async {
    _logger.i('argument: $context');

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _transaction?.date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      dateController.text = DateFormat('MMM dd, yyyy').format(selectedDate);
    }
  }

  void setTransactionTime(BuildContext context) async {
    _logger.i('argument: $context');

    final DateTime now = _transaction?.date ?? DateTime.now();

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

    double amount = parseAmountStringToDouble(_amountController!.text);

    if (transactionTypeValue ==
            EnumToString.convertToString(TransactionType.transfer) &&
        destinationAccountIdValue == null) {
      destinationAccountFocusNode.requestFocus();
      handleShowSnackbar(message: "Please select transfer destination account");
      return;
    }

    if (amount == 0) {
      amountFieldFocusNode.requestFocus();
      handleShowSnackbar(message: "Please enter an amount not equal to zero");
      return;
    }

    amount = transactionTypeValue ==
            EnumToString.convertToString(TransactionType.expense)
        ? amount.abs() * -1
        : amount.abs();

    _logger.e("accountIdValue: $accountIdValue");
    _logger.e("transactionTypeValue: $transactionTypeValue");
    _logger.e("destinationAccountIdValue: $destinationAccountIdValue");
    _logger.e("amount: $amount");
    _logger.e("category: $categoryIdValue");
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

    final newTransaction = Transaction(
      accountId: int.parse(accountIdValue!),
      destinationAccountId: destinationAccountIdValue != null
          ? int.parse(destinationAccountIdValue!)
          : null,
      transactionType: EnumToString.fromString(
        TransactionType.values,
        transactionTypeValue!,
      ),
      amount: amount,
      categoryId: int.parse(categoryIdValue!),
      date: date,
      notes: _notesController!.text,
    );

    _transactionService.createTransaction(newTransaction);
    // TODO: Adjust balance as well
    // TODO: Create pair transaction for transfer type
    // TODO: Handle update transaction

    popCurrentView();
  }

  bool showNegativeAmountPrefix() {
    _logger.i('argument: NONE');

    final amount = parseAmountStringToDouble(_amountController?.text ?? "0");

    if (amount == 0) {
      return false;
    }

    return transactionTypeValue ==
        EnumToString.convertToString(TransactionType.expense);
  }

  void filterDestinationAccount() {
    _logger.i('argument: NONE');

    destinationAccounts = accounts
        .where((acc) => acc.id != int.parse(accountIdValue ?? '-1'))
        .toList();
  }

  void handleShowSnackbar({required String message}) {
    _logger.i('argument: {message: $message}');

    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.main,
      message: message,
      duration: const Duration(seconds: 2),
      onTap: () {},
    );
  }

  @override
  void dispose() {
    amountFieldFocusNode.dispose();
    destinationAccountFocusNode.dispose();
    super.dispose();
  }

  @override
  void setFormStatus() {}
}
