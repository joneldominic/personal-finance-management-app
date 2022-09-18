import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/services/theme_service.dart';
import 'package:stacked/stacked.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class SettingsViewModel extends BaseViewModel {
  final _themeService = locator<ThemeService>();
  final _logger = getLogger("SettingsViewModel");

  bool getIsThemeModeIsDark() {
    _logger.i(_themeService.isLightTheme);
    return _themeService.isDarkTheme;
  }

  void toggleTheme(bool _) {
    _themeService.toggleTheme();
    notifyListeners();
  }
}
