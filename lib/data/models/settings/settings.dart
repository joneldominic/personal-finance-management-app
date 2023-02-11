import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id? id;

  bool? isLightTheme;

  Settings({
    required this.id,
    this.isLightTheme = true,
  });

  @override
  String toString() => 'Account('
      'id: $id, '
      'isLightTheme: $isLightTheme'
      ')';
}
