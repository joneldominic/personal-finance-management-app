import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:personal_finance_management_app/services/settings_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class SettingsViewModel extends BaseViewModel {
  final _logger = getLogger('SettingsViewModel');
  final _settingsService = locator<SettingsService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  bool getIsThemeModeIsDark() {
    _logger.i('argument: NONE');
    return !_settingsService.isLightTheme;
  }

  void toggleTheme(bool value) {
    _logger.i('argument: $value');
    _settingsService.toggleTheme();
    notifyListeners();
  }

  void navigateToAccountSettings() {
    _logger.i('argument: NONE');
    _navigationService.navigateToAccountSettingsView();
  }

  void navigateToCategoryList() {
    _logger.i('argument: NONE');
    _navigationService.navigateToCategoryListView();
  }

  void navigateToProfile() {
    _logger.i('argument: NONE');
    _navigationService.navigateToProfileView();
  }

  void navigateToNotifications() {
    _logger.i('argument: NONE');

    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.main,
      message: "Feature coming soon! Stay tuned for updates.",
      duration: const Duration(seconds: 2),
      onTap: () {},
    );
  }

  void navigateToAbout() {
    _logger.i('argument: NONE');
    _navigationService.navigateToAboutView();
  }
}
