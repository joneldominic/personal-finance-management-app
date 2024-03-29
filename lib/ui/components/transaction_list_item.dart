import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/core/utils/text_style_helpers.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
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

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final account = transaction.account.value;
    final destinationAccount = transaction.destinationAccount.value;
    final sourceAccountName = account?.name ?? '(Deleted Account)';
    final destinationAccountName = transaction.transferTransactionType != null
        ? destinationAccount?.name ?? '(Deleted Account)'
        : null;
    final category = transaction.category.value;
    final isExpense = (transaction.transferTransactionType ?? transaction.transactionType) ==
        TransactionType.expense;
    final iconColor = _getIconColor(
      customTheme: customTheme,
      sourceAccount: account,
      destinationAccount: destinationAccount,
      transferTransactionType: transaction.transferTransactionType,
    );

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: iconColor,
        foregroundColor: customTheme.iconForegroundColor,
        child: Icon(category?.categoryIcon?.iconData ?? UNDEFINED_ICON),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemeText.listItemTitle(category?.name ?? ''),
          _buildAccountName(
            accountName: sourceAccountName,
            distAccountName: destinationAccountName,
            isExpense: isExpense,
          ),
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
                    currency: account?.currency ?? "₱",
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

  Widget _buildAccountName({
    required String? accountName,
    required String? distAccountName,
    required bool isExpense,
  }) {
    final isBold = distAccountName != null && isExpense;

    return Text.rich(
      TextSpan(
        style: listItemSubTitleStyle,
        children: <TextSpan>[
          TextSpan(
              text: accountName,
              style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
          if (distAccountName != null) ...[
            const TextSpan(text: " ➜ "),
            TextSpan(
                text: distAccountName,
                style: TextStyle(fontWeight: isBold ? FontWeight.w500 : FontWeight.bold)),
          ]
        ],
      ),
    );
  }

  Color _getIconColor({
    required CustomTheme customTheme,
    required Account? sourceAccount,
    required Account? destinationAccount,
    required TransactionType? transferTransactionType,
  }) {
    final account =
        transferTransactionType == TransactionType.income ? destinationAccount : sourceAccount;

    return account != null
        ? Color(
            int.parse(account.color!),
          )
        : customTheme.iconBackgroundColor!;
  }
}
