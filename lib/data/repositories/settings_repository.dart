import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/dao/settings_dao.dart';
import 'package:personal_finance_management_app/data/models/settings/settings.dart';

class SettingsRepository {
  final _logger = getLogger('SettingsRepository');
  final SettingsDao settingsDao;

  SettingsRepository({required this.settingsDao});

  Future<Settings> initSettings() async {
    _logger.i('argument: NONE');

    final settings = Settings(id: SETTINGS_ID);
    return settingsDao.createSettings(settings);
  }

  Future<Settings> getSettings() async {
    _logger.i('argument: NONE');

    final existingSettings = await settingsDao.getSettingsById(SETTINGS_ID);
    if (existingSettings != null) {
      return existingSettings;
    }

    return await initSettings();
  }

  Future<Settings> updateSettings({isLightTheme}) async {
    _logger.i('argument: {isLightTheme: $isLightTheme}');

    final settings = await getSettings();
    settings.isLightTheme = isLightTheme ?? settings.isLightTheme;

    return settingsDao.updateSettings(settings);
  }

  Stream<Settings?> watchSettings() async* {
    _logger.i('argument: NONE');
    yield* settingsDao.watchSettingsById(SETTINGS_ID);
  }
}
