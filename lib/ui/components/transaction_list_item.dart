import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.transaction,
    required this.onTap,
  }) : super(key: key);

  final Transaction transaction;
  final void Function()? onTap;

  // TODO: On Transfer make bold for target account

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final isExpense = (transaction.transferTransactionType ?? transaction.transactionType) ==
        TransactionType.expense;

    final account = transaction.account.value!;
    final destinationAccountName = transaction.destinationAccount.value?.name;
    final category = transaction.category.value!;
    final accountNameDisplay = transaction.transactionType == TransactionType.transfer
        ? "${account.name} ➜ $destinationAccountName"
        : "${account.name}";

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Color(
          int.parse(category.color ?? '0xFFFFFFFF'),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemeText.listItemTitle(category.name ?? ''),
          ThemeText.listItemSubTitle(accountNameDisplay),
        ],
      ),
      trailing: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ThemeText.listItemSubTitle(
                  doubleToCurrencyFormatter(
                    currency: account.currency ?? "PHP",
                    value: transaction.amount!,
                  ),
                  color: isExpense ? customTheme.danger : customTheme.success,
                ),
                Icon(
                  isExpense ? Icons.arrow_drop_down_rounded : Icons.arrow_drop_up_rounded,
                  color: isExpense ? customTheme.danger : customTheme.success,
                ),
              ],
            ),
            ThemeText.listItemSubTitle(
              DateFormat('MMM dd, yyyy').format(transaction.date!),
            ),
          ],
        ),
      ),
    );
  }
}
