import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

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

  bool? isDefault;

  @Backlink(to: 'account')
  final transactions = IsarLinks<Transaction>();

  Account({
    required this.name,
    required this.currency,
    required this.balance,
    required this.color,
    required this.isExcludedFromAnalysis,
    required this.isArchived,
    this.isDefault = false,
  });

  @override
  String toString() => 'Account('
      'id: $id, '
      'name: $name, '
      'currency: $currency, '
      'balance: $balance, '
      'color: $color, '
      'isExcludedFromAnalysis: $isExcludedFromAnalysis, '
      'isArchived: $isArchived'
      ')';
}
