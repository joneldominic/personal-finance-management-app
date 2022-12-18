import 'package:isar/isar.dart';

part 'transaction.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;

  int? accountId;

  String? transactionType;

  double? amount;

  String? category;

  DateTime? date;

  String? notes;

  Transaction({
    required this.accountId,
    required this.transactionType,
    required this.amount,
    required this.category,
    required this.date,
    required this.notes,
  });

  @override
  String toString() => 'Transaction('
      'id: $id'
      'accountId: $accountId,'
      'transactionType: $transactionType,'
      'amount: $amount,'
      'category: $category,'
      'date: $date,'
      'notes: $notes,'
      ')';
}
