import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:personal_finance_management_app/services/cashflow_service.dart';
import 'package:personal_finance_management_app/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _accountStreamKey = 'account-stream';
const String _transactionStreamKey = 'transaction-stream';
const String _cashflowStreamKey = 'cashflow-stream';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services
class MainViewModel extends MultipleStreamViewModel {
  final _logger = getLogger('MainViewModel');
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();
  final _transactionService = locator<TransactionService>();
  final _cashFlowService = locator<CashFlowService>();
  final _snackbarService = locator<SnackbarService>();

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  DateTime? backButtonPressTime;
  final doubleTapQuitDelayDuration = const Duration(seconds: 2);

  void setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _accountStreamKey: StreamData<List<Account>>(_accountService.accountCollectionStream()),
        _transactionStreamKey:
            StreamData<List<Transaction>>(_transactionService.transactionCollectionStream()),
        _cashflowStreamKey: StreamData<CashFlow?>(_cashFlowService.watchCashFlow()),
      };

  bool get accountsReady => dataReady(_accountStreamKey);
  List<Account> get accounts => dataMap![_accountStreamKey] ?? [];
  bool get transactionsReady => dataReady(_transactionStreamKey);
  List<Transaction> get transactions => dataMap![_transactionStreamKey] ?? [];
  bool get cashFlowReady => dataReady(_cashflowStreamKey);
  CashFlow get cashFlow => dataMap![_cashflowStreamKey] ?? CashFlow(id: CASH_FLOW_ID);

  void navigateToTransactionDetail() {
    _logger.i('argument: NONE');
    _navigationService.navigateToTransactionDetailView();
  }

  Future<bool> handleWillPop() {
    _logger.i('argument: NONE');
    final now = DateTime.now();

    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed = backButtonPressTime == null ||
        now.difference(backButtonPressTime!) > doubleTapQuitDelayDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.main,
        message: "Press Back again to quit the App",
        duration: doubleTapQuitDelayDuration,
        onTap: () {},
      );
      return Future.value(false);
    }

    return Future.value(true);
  }
}
