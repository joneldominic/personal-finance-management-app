import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/settings_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/settings/settings.dart';

class SettingsDaoImpl extends SettingsDao {
  static final SettingsDaoImpl _settingsDaoImpl = SettingsDaoImpl._internal();

  factory SettingsDaoImpl() {
    return _settingsDaoImpl;
  }

  SettingsDaoImpl._internal();

  final _logger = getLogger('SettingsDaoImpl');

  Future<Isar> get _db async => await IsarDatabase.instance.database;

  @override
  Future<Settings> createSettings(Settings settings) async {
    _logger.i('argument: $settings');

    Isar isar = await _db;

    final settingsCollection = isar.settings;
    final createdSettings = await isar.writeTxn(() async {
      final id = await settingsCollection.put(settings);
      return await settingsCollection.get(id);
    });

    return createdSettings!;
  }

  @override
  Future<Settings?> getSettingsById(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;

    final settingsCollection = isar.settings;
    final settings = await isar.writeTxn(() async {
      return await settingsCollection.get(id);
    });

    return settings;
  }

  @override
  Future<Settings> updateSettings(Settings settings) async {
    _logger.i('argument: $settings');

    Isar isar = await _db;

    final settingsCollection = isar.settings;
    final updatedSettings = await isar.writeTxn(() async {
      await settingsCollection.put(settings);
      return settings;
    });

    return updatedSettings;
  }

  @override
  Stream<Settings?> watchSettingsById(Id id) async* {
    _logger.i('argument: $id');

    Isar isar = await _db;
    final settingsCollection = isar.settings;

    yield* settingsCollection.watchObject(id, fireImmediately: true);
  }
}
