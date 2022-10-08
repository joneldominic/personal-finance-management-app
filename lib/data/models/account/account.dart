import 'package:isar/isar.dart';

part 'account.g.dart';

@collection
class Account {
  Id id = Isar.autoIncrement;

  String? name;

  String? currency;

  double? balance;

  String? color;

  bool? isExcludedFromAnalysis;

  bool? isArchived;

  Account({
    required this.name,
    required this.currency,
    required this.balance,
    required this.color,
    required this.isExcludedFromAnalysis,
    required this.isArchived,
  });

  @override
  String toString() => 'Account('
      'name: $name, '
      'currency: $currency, '
      'balance: $balance, '
      'color: $color, '
      'isExcludedFromAnalysis: $isExcludedFromAnalysis, '
      'isArchived: $isArchived, '
      ')';
}
