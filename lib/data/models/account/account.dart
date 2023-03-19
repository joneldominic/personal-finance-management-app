import 'package:decimal/decimal.dart';
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

  bool? isSelected;

  @Backlink(to: 'account')
  final transactions = IsarLinks<Transaction>();

  @Backlink(to: 'destinationAccount')
  final destTransactions = IsarLinks<Transaction>();

  Account({
    required this.name,
    required this.currency,
    required this.balance,
    required this.color,
    required this.isExcludedFromAnalysis,
    required this.isArchived,
    this.isDefault = false,
    this.isSelected = true,
  });

  Account.clone(Account account) {
    name = account.name;
    currency = account.currency;
    balance = account.balance;
    color = account.color;
    isExcludedFromAnalysis = account.isExcludedFromAnalysis;
    isArchived = account.isArchived;
    isDefault = account.isDefault;
    isSelected = account.isSelected;
  }

  @ignore
  Decimal get dBalance => balance != null ? Decimal.parse(balance.toString()) : Decimal.zero;

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
