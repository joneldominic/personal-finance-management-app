import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/settings_dao_impl.dart';
import 'package:personal_finance_management_app/data/models/settings/settings.dart';
import 'package:personal_finance_management_app/data/repositories/settings_repository.dart';
import 'package:stacked/stacked.dart';

class SettingsService with ReactiveServiceMixin {
  final _logger = getLogger('SettingsService');
  final _settingsRepository = SettingsRepository(settingsDao: SettingsDaoImpl());

  late Stream<Settings?> _settingsStream;

  SettingsService() {
    listenToReactiveValues([_isLightTheme]);

    _settingsStream = _settingsRepository.watchSettings();
    _settingsStream.listen((settings) {
      _isLightTheme.value = settings == null ? true : settings.isLightTheme!;
    });
  }

  final ReactiveValue<bool> _isLightTheme = ReactiveValue<bool>(true);

  bool get isLightTheme => _isLightTheme.value;

  void toggleTheme() {
    _logger.i('argument: NONE');

    _logger.i('{isLightTheme: ${_isLightTheme.value}}');
    _settingsRepository.updateSettings(isLightTheme: !_isLightTheme.value);
  }

  Future<Settings> initSettings() {
    return _settingsRepository.initSettings();
  }
}
