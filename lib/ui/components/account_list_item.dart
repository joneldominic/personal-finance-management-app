import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class AccountListItem extends StatelessWidget {
  const AccountListItem({
    Key? key,
    this.accountName,
    this.color,
    this.currency,
    this.amount,
    required this.onPressed,
  }) : super(key: key);

  final String? accountName;
  final Color? color;
  final String? currency;
  final String? amount;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: color,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemeText.listItemTitle(accountName ?? ''),
          ThemeText.listItemSubTitle(
            doubleToCurrencyFormatter(
                currency: currency ?? "PHP",
                value: double.parse(amount ?? '0')),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit_rounded,
          color: customTheme.actionButtonColor,
        ),
        iconSize: 20,
        onPressed: onPressed,
      ),
    );
  }
}
