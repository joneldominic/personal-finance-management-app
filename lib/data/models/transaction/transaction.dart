import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';

part 'transaction.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;

  int? accountId;

  @Enumerated(EnumType.name)
  TransactionType? transactionType;

  double? amount;

  String? category; // TODO: This should be id of category

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
      'transactionType: ${EnumToString.convertToString(transactionType)},'
      'amount: $amount,'
      'category: $category,'
      'date: $date,'
      'notes: $notes,'
      ')';
}
