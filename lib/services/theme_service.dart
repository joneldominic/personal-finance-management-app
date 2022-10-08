import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class ThemeService with ReactiveServiceMixin {
  final _logger = getLogger('ThemeService');

  ThemeService() {
    listenToReactiveValues([_isLightTheme]);
  }

  final ReactiveValue<bool> _isLightTheme = ReactiveValue<bool>(true);

  bool get isLightTheme => _isLightTheme.value;
  bool get isDarkTheme => !_isLightTheme.value;

  void toggleTheme() {
    _isLightTheme.value = !_isLightTheme.value;
    _logger.i('{isLightTheme: ${_isLightTheme.value}}');
  }
}
