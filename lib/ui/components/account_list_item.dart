import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class AccountListItem extends StatelessWidget {
  const AccountListItem({
    Key? key,
    required this.account,
    required this.onPressed,
  }) : super(key: key);

  final Account account;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Color(
          int.parse(account.color!),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemeText.listItemTitle(account.name ?? ''),
          ThemeText.listItemSubTitle(
            doubleToCurrencyFormatter(
              currency: account.currency ?? "₱",
              value: account.balance!,
            ),
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
