import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/services/settings_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _settingsService = locator<SettingsService>();
  final _logger = getLogger("StartUpViewModel");

  // Info Log - on every public function call with the following format: (functionName | arguments: test)
  // Warning Log - warn when expected value is not present or incorrect format
  // Error Log - Log the reason not the exception

  String title = 'Jonel';

  void doSomething() {
    // _logger.v("Verbose log", "test");
    // _logger.d("Debug log");
    // _logger.i("Info log");
    // _logger.w("Warning log");
    // _logger.e("Error log");
    // _logger.wtf("What a terrible failure log");

    _navigationService.navigateTo(Routes.mainView);
  }

  bool getThemeMode() {
    _logger.i(_settingsService.isLightTheme);
    return _settingsService.isLightTheme;
  }

  void toggleTheme(bool _) {
    _settingsService.toggleTheme();
    title = _settingsService.isLightTheme ? "Light" : "Dark";
    notifyListeners();
  }
}
