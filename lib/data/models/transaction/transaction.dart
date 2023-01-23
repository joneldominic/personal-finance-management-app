import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';

part 'transaction.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;

  int? accountId;

  @ignore
  String? accountName;

  @Enumerated(EnumType.name)
  TransactionType? transactionType;

  int? destinationAccountId;

  @ignore
  String? destinationAccountName;

  String? transferId;

  @ignore
  String? accountCurrency;

  double? amount;

  @Enumerated(EnumType.name)
  TransactionType? transferTransactionType;

  int? categoryId;

  @ignore
  String? categoryName;

  @ignore
  String? categoryColor;

  DateTime? date;

  String? notes;

  Transaction({
    required this.accountId,
    required this.transactionType,
    this.destinationAccountId,
    this.transferId,
    this.transferTransactionType,
    required this.amount,
    required this.categoryId,
    required this.date,
    required this.notes,
  });

  Transaction.clone(Transaction transaction)
      : this(
          accountId: transaction.accountId,
          transactionType: transaction.transactionType,
          destinationAccountId: transaction.destinationAccountId,
          transferId: transaction.transferId,
          transferTransactionType: transaction.transferTransactionType,
          amount: transaction.amount,
          categoryId: transaction.categoryId,
          date: transaction.date,
          notes: transaction.notes,
        );

  @override
  String toString() => 'Transaction('
      'id: $id, '
      'accountId: $accountId, '
      'accountName: $accountName, '
      'transactionType: ${EnumToString.convertToString(transactionType)}, '
      'destinationAccountId: $destinationAccountId, '
      'transferId: $transferId, '
      'transferTransactionType: $transferTransactionType, '
      'accountCurrency: $accountCurrency, '
      'amount: $amount, '
      'categoryId: $categoryId, '
      'categoryName: $categoryName, '
      'categoryColor: $categoryColor, '
      'date: $date, '
      'notes: $notes'
      ')';
}
