import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:personal_finance_management_app/services/category_service.dart';
import 'package:personal_finance_management_app/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

const String _accountStreamKey = 'account-stream';
const String _categoryStreamKey = 'category-stream';
const String _transactionStreamKey = 'transaction-stream';

// TODO: Try making it a separate class as base view model for transactions related view
class TransactionListViewModel extends MultipleStreamViewModel {
  final _logger = getLogger('TransactionListViewModel');
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();
  final _categoryService = locator<CategoryService>();
  final _transactionService = locator<TransactionService>();

  bool get accountsReady => dataReady(_accountStreamKey);
  List<Account> get accounts => dataMap![_accountStreamKey];

  bool get categoriesReady => dataReady(_categoryStreamKey);
  List<Category> get categories => dataMap![_categoryStreamKey];

  bool get transactionsReady => dataReady(_transactionStreamKey);
  List<Transaction> get transactions {
    List<Transaction> trxs = dataMap![_transactionStreamKey];

    for (Transaction t in trxs) {
      final account =
          accounts.firstWhere((account) => account.id == t.accountId!);

      final category =
          categories.firstWhere((category) => category.id == t.categoryId!);

      t.accountName = account.name;
      t.accountCurrency = account.currency;
      t.categoryName = category.name;
      t.categoryColor = category.color;
    }

    trxs.sort(((a, b) => b.date!.compareTo(a.date!)));

    _logger.i(trxs);
    return trxs;
  }

  bool get streamDataReady =>
      accountsReady && categoriesReady && transactionsReady;

  @override
  Map<String, StreamData> get streamsMap => {
        _accountStreamKey: StreamData<List<Account>>(
            _accountService.accountCollectionStream()),
        _categoryStreamKey: StreamData<List<Category>>(
            _categoryService.categoryCollectionStream()),
        _transactionStreamKey: StreamData<List<Transaction>>(
            _transactionService.transactionCollectionStream()),
      };

  void navigateToTransactionDetailEditMode() {
    _logger.i('argument: NONE');

    // TODO: Implement edit mode
    _navigationService.navigateToTransactionDetailView(isAddTransaction: false);
  }
}
