import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/models/settings/settings.dart';

abstract class SettingsDao {
  Future<Settings> createSettings(Settings settings);
  Future<Settings?> getSettingsById(Id id);
  Future<Settings> updateSettings(Settings settings);
  Stream<Settings?> watchSettingsById(Id id);
}
