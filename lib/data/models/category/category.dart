import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/core/enums/category_nature.dart';

part 'category.g.dart';

@collection
class Category {
  Id id = Isar.autoIncrement;

  String? name;

  @Enumerated(EnumType.name)
  CategoryNature? nature;

  String? color;

  bool? isVisible;

  Category({
    required this.name,
    required this.nature,
    required this.color,
    required this.isVisible,
  });

  @override
  String toString() => 'Account('
      'id: $id'
      'name: $name, '
      'categoryNature: ${EnumToString.convertToString(nature)}, '
      'color: $color, '
      'isVisible: $isVisible, '
      ')';
}
