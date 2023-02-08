import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/dialog_type.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
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
import 'package:uuid/uuid.dart';

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
  final _dialogService = locator<DialogService>();

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
      transactionTypeValue == EnumToString.convertToString(TransactionType.transfer) &&
          destinationAccounts.isEmpty;

  bool get disableCategoryField =>
      transactionTypeValue == EnumToString.convertToString(TransactionType.transfer);

  List<Account> accounts = [];
  List<Account> destinationAccounts = [];
  List<Category> categories = [];
  List<Category> filteredCategories = [];

  int transferCategoryId = -1;
  int undefinedCategoryId = -1;

  // TODO: Reload stream on account or category changes
  // TODO: Improve linked props implementation

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
          ? transaction?.account.value?.id.toString() ?? accounts[0].id.toString()
          : "",
    );

    setTransactionType(
      EnumToString.convertToString(
        transaction?.transactionType ?? TransactionType.expense,
      ),
    );

    if (transaction?.transactionType == TransactionType.transfer &&
        transaction?.destinationAccount.value?.id != null) {
      setDestinationAccountId(transaction!.destinationAccount.value!.id.toString());
    }

    Account? account = accounts.firstWhereOrNull((acc) => acc.id == transaction?.account.value?.id);
    currencyInputFormatter = CurrencyInputFormatter(
      symbol: accounts.isNotEmpty ? account?.currency ?? accounts[0].currency! : "PHP",
      allowNegative: false,
    );
    _amountController = amountController;
    amountController.text = currencyInputFormatter.reformat(transaction?.amount.toString() ?? '0');

    filterCategories();
    setCategoryId(
      categories.isNotEmpty
          ? transaction?.category.value?.id.toString() ?? undefinedCategoryId.toString()
          : '',
    );

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

    filteredCategories = categories;

    transferCategoryId =
        categories.firstWhereOrNull((c) => c.name == TRANSFER_CATEGORY_NAME)?.id ?? -1;
    undefinedCategoryId =
        categories.firstWhereOrNull((c) => c.name == UNDEFINED_CATEGORY_NAME)?.id ?? -1;
  }

  void initDateTimeFields(DateTime? dateTime) {
    _logger.i('argument: $dateTime');

    final DateTime now = dateTime ?? DateTime.now();
    final String date = DateFormat('MMM dd, yyyy').format(now);
    final String time = DateFormat('hh:mm:ss a').format(now);

    dateController.text = date;
    timeController.text = time;
  }

  void popCurrentView() {
    _logger.i('argument: NONE | Navigation Pop: 1');
    _navigationService.popRepeated(1);
  }

  void handleAccountChange(String accountId) {
    _logger.i('argument: $accountId');

    if (accountId == destinationAccountIdValue) {
      filterDestinationAccount(shouldFilter: false);
      setDestinationAccountId(accountIdValue!);
    }

    setAccountId(accountId);
    filterDestinationAccount();

    Account account = accounts.firstWhere(
      (acc) => acc.id == int.parse(accountId),
    );
    currencyInputFormatter =
        CurrencyInputFormatter(symbol: account.currency!, allowNegative: false);
    _amountController!.text = currencyInputFormatter.reformat(_amountController!.text);
  }

  void handleDestinationAccountChange(String accountId) {
    _logger.i('argument: $accountId');
    setDestinationAccountId(accountId);
  }

  void handleTransactionTypeChange(String transactionType) {
    _logger.i('argument: $transactionType');

    if (transactionType == EnumToString.convertToString(TransactionType.transfer)) {
      destinationAccountFocusNode.requestFocus();
      filterDestinationAccount();
      setCategoryId(transferCategoryId.toString());
    } else if (transactionTypeValue == EnumToString.convertToString(TransactionType.transfer)) {
      setCategoryId(undefinedCategoryId.toString());
    }

    setTransactionType(transactionType);
    filterCategories();
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
      final String time = DateFormat('hh:mm:ss a')
          .format(DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute));
      timeController.text = time;
    }
  }

  void handleSaveTransaction() async {
    _logger.i('argument: NONE');

    double amount = parseAmountStringToDouble(_amountController!.text);

    final currTransactionTypeIsTransfer =
        transactionTypeValue == EnumToString.convertToString(TransactionType.transfer);

    if (currTransactionTypeIsTransfer && destinationAccountIdValue == null) {
      destinationAccountFocusNode.requestFocus();
      handleShowSnackbar(message: "Please select transfer destination account");
      return;
    }

    if (amount == 0) {
      amountFieldFocusNode.requestFocus();
      handleShowSnackbar(message: "Please enter an amount not equal to zero");
      return;
    }

    amount = transactionTypeValue == EnumToString.convertToString(TransactionType.expense)
        ? amount.abs() * -1
        : amount.abs();

    final date = DateFormat("MMM dd, yyyy - hh:mm:ss a")
        .parse("${dateController.text} - ${timeController.text}");

    final tempAccount = accounts.firstWhereOrNull(
      (a) => a.id == int.parse(accountIdValue!),
    );

    final tempDestAccount = currTransactionTypeIsTransfer
        ? accounts.firstWhereOrNull(
            (a) => a.id == int.parse(destinationAccountIdValue!),
          )
        : null;

    final tempCategory = categories.firstWhereOrNull((c) => c.id == int.parse(categoryIdValue!));

    final newTransaction = Transaction(
      transactionType: EnumToString.fromString(
        TransactionType.values,
        transactionTypeValue!,
      ),
      amount: amount,
      date: date,
      notes: _notesController!.text,
    )
      ..account.value = tempAccount
      ..destinationAccount.value = tempDestAccount
      ..category.value = tempCategory;

    if (_transaction != null) {
      final oldTransactionTypeIsTransfer =
          _transaction!.transactionType == TransactionType.transfer;

      if (currTransactionTypeIsTransfer) {
        if (oldTransactionTypeIsTransfer) {
          await _transactionService.deleteTransactionsByTransferId(_transaction!.transferId!);
        } else {
          await _transactionService.deleteTransaction(_transaction!.id);
        }

        final updatedTransaction = await _saveTransferTransaction(newTransaction);
        _logger.i('Transactions Updated Successfully: $updatedTransaction');
      } else {
        if (oldTransactionTypeIsTransfer) {
          await _transactionService.deleteTransactionsByTransferId(_transaction!.transferId!);
        }

        newTransaction.id = _transaction!.id;
        final updatedTransaction = await _transactionService.updateTransaction(newTransaction);
        _logger.i('Transaction Updated Successfully: $updatedTransaction');
      }
    } else {
      if (currTransactionTypeIsTransfer) {
        final addedTransactions = await _saveTransferTransaction(newTransaction);
        _logger.i('Transactions Saved Successfully: $addedTransactions');
      } else {
        final addedTransaction = await _transactionService.createTransaction(newTransaction);
        _logger.i('Transaction Saved Successfully: $addedTransaction');
      }
    }

    // TODO: Adjust balance as well

    popCurrentView();
  }

  Future<List<Transaction>> _saveTransferTransaction(Transaction newTransaction) async {
    final transferId = const Uuid().v1();

    newTransaction.transferId = transferId;
    final pairTransaction = Transaction.clone(newTransaction);

    newTransaction.transferTransactionType = TransactionType.income;
    pairTransaction.transferTransactionType = TransactionType.expense;

    return await _transactionService.createPairTransaction([newTransaction, pairTransaction]);
  }

  void handleDeleteTransaction() async {
    _logger.i('argument: NONE');

    final response = await _dialogService.showCustomDialog(
      variant: DialogType.deleteConfirmation,
      data: "Do you really want to delete this transaction?",
    );

    if (response == null || !response.confirmed) {
      _logger.w("Delete Transaction Cancelled");
      return;
    }

    if (_transaction!.transactionType == TransactionType.transfer) {
      await _transactionService.deleteTransactionsByTransferId(_transaction!.transferId!);
    } else {
      await _transactionService.deleteTransaction(_transaction!.id);
    }

    popCurrentView();
  }

  bool showNegativeAmountPrefix() {
    _logger.i('argument: NONE');

    final amount = parseAmountStringToDouble(_amountController?.text ?? "0");

    if (amount == 0) {
      return false;
    }

    return transactionTypeValue == EnumToString.convertToString(TransactionType.expense);
  }

  void filterDestinationAccount({bool shouldFilter = true}) {
    _logger.i('argument: {shouldFilter: $shouldFilter}');

    if (!shouldFilter) {
      destinationAccounts = accounts;
    }

    // TODO: Make sure transfer can be done to the same currency only
    destinationAccounts =
        accounts.where((acc) => acc.id != int.parse(accountIdValue ?? '-1')).toList();
  }

  void filterCategories() {
    if (transactionTypeValue != EnumToString.convertToString(TransactionType.transfer)) {
      // Exclude TRANSFER category when transaction type is not transfer
      filteredCategories = categories.sublist(1);
    } else {
      filteredCategories = categories;
    }
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
