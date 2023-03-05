import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/core/enums/category_nature.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

part 'category.g.dart';

@collection
class Category {
  Id id = Isar.autoIncrement;

  String? name;

  @Enumerated(EnumType.name)
  CategoryNature? nature;

  String? color;

  bool? isVisible;

  bool? isDefault;

  CategoryIconData? categoryIconData;

  @Backlink(to: 'category')
  final transactions = IsarLinks<Transaction>();

  Category({
    required this.name,
    required this.nature,
    required this.color,
    required this.categoryIconData,
    required this.isVisible,
    this.isDefault = false,
  });

  @override
  String toString() => 'Account('
      'id: $id, '
      'name: $name, '
      'categoryNature: ${EnumToString.convertToString(nature)}, '
      'color: $color, '
      'categoryIconData: $categoryIconData, '
      'isVisible: $isVisible, '
      'isDefault: $isDefault'
      ')';
}

@embedded
class CategoryIconData {
  final int codePoint;
  final String? fontFamily;
  final String? fontPackage;
  final bool matchTextDirection;

  const CategoryIconData({
    this.codePoint = 0,
    this.fontFamily = '',
    this.fontPackage = '',
    this.matchTextDirection = false,
  });

  CategoryIconData.fromIconData(IconData iconData)
      : codePoint = iconData.codePoint,
        fontFamily = iconData.fontFamily,
        fontPackage = iconData.fontPackage,
        matchTextDirection = iconData.matchTextDirection;

  @ignore
  get iconData => IconData(
        codePoint,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
        matchTextDirection: matchTextDirection,
      );

  @override
  String toString() => 'CategoryIconData('
      'codePoint: $codePoint, '
      'fontFamily: $fontFamily, '
      'fontPackage: $fontPackage, '
      'matchTextDirection: $matchTextDirection'
      ')';
}
