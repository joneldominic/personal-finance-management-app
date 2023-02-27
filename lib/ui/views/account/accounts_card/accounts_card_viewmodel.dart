import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class AccountsCardViewModel extends BaseViewModel {
  final _logger = getLogger('AccountsCardViewModel');
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();

  bool _isMultiSelect = false;

  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

  void navigateToAccountSettings() {
    _logger.i('argument: NONE');
    _navigationService.navigateToAccountSettingsView();
  }

  void navigateToAccountDetail() {
    _logger.i('argument: NONE');
    _navigationService.navigateToAccountDetailView();
  }

  void selectAccount(Account account) {
    _logger.e('argument: $account');

    _isFiltered = true;
    notifyListeners();

    _accountService.selectAccount(account, multi: _isMultiSelect);
  }

  void multiSelectAccount(Account account) {
    _logger.e('argument: $account');

    _isMultiSelect = true;
    _isFiltered = true;
    notifyListeners();

    _accountService.selectAccount(account, multi: _isMultiSelect);
  }

  void clearFilter() {
    _logger.i('argument: NONE');

    _isMultiSelect = false;
    _isFiltered = false;
    notifyListeners();

    _accountService.selectAllAccounts();
  }
}
