import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/extensions/list_extension.dart';
import 'package:stacked/stacked.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class HomeAppBarViewModel extends BaseViewModel {
  final _logger = getLogger('HomeAppBarViewModel');

  double calculateTotalBalance(List<Account> accounts) {
    _logger.i('argument: $accounts');
    final sum = accounts.sumBy((account) => account.balance!);
    return sum.toDouble();
  }
}
