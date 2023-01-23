import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RecentTransactionsViewModel extends BaseViewModel {
  // ignore: unused_field
  final _logger = getLogger('TransactionListViewModel');
  // ignore: unused_field
  final _navigationService = locator<NavigationService>();

  // TODO: Handle on item click - edit mode
  // void navigateToTransactionDetailEditMode() {
  //   _logger.i('argument: NONE');

  //   // TODO: Implement edit mode
  //   _navigationService.navigateToTransactionDetailView(isAddTransaction: false);
  // }
}
