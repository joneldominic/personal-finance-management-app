import 'package:isar/isar.dart';

part 'cashflow.g.dart';

@collection
class CashFlow {
  Id? id;

  double? net;

  double? income;

  double? incomePercentage;

  double? expenses;

  double? expensesPercentage;

  // This is sort of a dummy filter
  int? daysCount;

  CashFlow({
    required this.id,
    this.net = 0.0,
    this.income = 0.0,
    this.incomePercentage = 0.0,
    this.expenses = 0.0,
    this.expensesPercentage = 0.0,
    this.daysCount = 30,
  });

  @override
  String toString() => 'Account('
      'id: $id, '
      'net: $net, '
      'income: $income, '
      'incomePercentage: $incomePercentage, '
      'expenses: $expenses, '
      'expensesPercentage: $expensesPercentage, '
      'daysCount: $daysCount'
      ')';
}
