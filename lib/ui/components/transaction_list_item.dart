import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    this.categoryName,
    this.categoryColor,
    this.accountName,
    this.accountCurrency,
    this.amount,
    this.transactionType,
    this.timeStamp,
    required this.onTap,
  }) : super(key: key);

  final String? categoryName;
  final String? categoryColor;
  final String? accountName;
  final String? accountCurrency;
  final double? amount;
  final TransactionType? transactionType;
  final DateTime? timeStamp;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Color(
          int.parse(categoryColor ?? '0xFFFFFFFF'),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemeText.listItemTitle(categoryName ?? ''),
          ThemeText.listItemSubTitle(accountName ?? ''),
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
                    currency: accountCurrency ?? "PHP",
                    value: amount!,
                  ),
                  color: transactionType == TransactionType.expense
                      ? customTheme.danger
                      : customTheme.success,
                ),
                Icon(
                  transactionType == TransactionType.expense
                      ? Icons.arrow_drop_down_rounded
                      : Icons.arrow_drop_up_rounded,
                  color: transactionType == TransactionType.expense
                      ? customTheme.danger
                      : customTheme.success,
                ),
              ],
            ),
            ThemeText.listItemSubTitle(
              DateFormat('MMM dd, yyyy').format(timeStamp!),
            ),
          ],
        ),
      ),
    );
  }
}
