import 'package:stacked/stacked.dart';

class ThemeService with ReactiveServiceMixin {
  ThemeService() {
    listenToReactiveValues([_isLightTheme]);
  }

  final ReactiveValue<bool> _isLightTheme = ReactiveValue<bool>(true);
  bool get isLightTheme => _isLightTheme.value;

  void toggleTheme() {
    _isLightTheme.value = !_isLightTheme.value;
  }
}
