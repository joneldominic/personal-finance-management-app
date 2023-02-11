import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RecentTransactionsViewModel extends BaseViewModel {
  final _logger = getLogger('TransactionListViewModel');
  final _navigationService = locator<NavigationService>();

  void navigateToTransactionDetailEditMode(Transaction? transaction) {
    _logger.i('argument: NONE');

    _navigationService.navigateToTransactionDetailView(
      transaction: transaction,
    );
  }
}
