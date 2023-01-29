import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';

part 'transaction.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;

  final account = IsarLink<Account>();

  @Enumerated(EnumType.name)
  TransactionType? transactionType;

  final destinationAccount = IsarLink<Account>();

  String? transferId;

  double? amount;

  @Enumerated(EnumType.name)
  TransactionType? transferTransactionType;

  final category = IsarLink<Category>();

  DateTime? date;

  String? notes;

  Transaction({
    required this.transactionType,
    this.transferId,
    this.transferTransactionType,
    required this.amount,
    required this.date,
    required this.notes,
  });

  Transaction.clone(Transaction transaction) {
    account.value = transaction.account.value;
    transactionType = transaction.transactionType;
    destinationAccount.value = transaction.destinationAccount.value;
    transferId = transaction.transferId;
    amount = transaction.amount;
    transferTransactionType = transaction.transferTransactionType;
    category.value = transaction.category.value;
    date = transaction.date;
    notes = transaction.notes;
  }

  @override
  String toString() => 'Transaction('
      'id: $id, '
      'account: $account, '
      'destinationAccount: $destinationAccount, '
      'transactionType: ${EnumToString.convertToString(transactionType)}, '
      'transferId: $transferId, '
      'transferTransactionType: $transferTransactionType, '
      'category: $category, '
      'amount: $amount, '
      'date: $date, '
      'notes: $notes'
      ')';
}
