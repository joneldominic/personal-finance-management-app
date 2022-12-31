import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/ui/viewmodels/transactions_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

// TODO: Implement recent transactions viewmodel here (should extend from TransactionsViewModel)import 'package:personal_finance_management_app/app/app.locator.dart';
// TODO: Try making it a separate class as base view model for transactions related view
class RecentTransactionsViewModel extends TransactionsViewModel {
  final _logger = getLogger('TransactionListViewModel');
  final _navigationService = locator<NavigationService>();

  List<Transaction> get recentTransactions {
    final endIndex = transactions.isEmpty
        ? 0
        : transactions.length < 5
            ? transactions.length - 1
            : 5;
    return transactions.sublist(0, endIndex);
  }

  // TODO: Handle show more - redirect to transaction screen

  // TODO: Handle on item click - edit mode
  // void navigateToTransactionDetailEditMode() {
  //   _logger.i('argument: NONE');

  //   // TODO: Implement edit mode
  //   _navigationService.navigateToTransactionDetailView(isAddTransaction: false);
  // }
}
