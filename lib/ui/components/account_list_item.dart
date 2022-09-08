import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class AccountListItem extends StatelessWidget {
  const AccountListItem({
    Key? key,
    this.accountName,
    this.color,
    this.amount,
  }) : super(key: key);

  final String? accountName;
  final Color? color;
  final String? amount;

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
          Text(
            accountName ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            amount ?? "",
            style: TextStyle(
              fontSize: 12,
              color: customTheme.customLightGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit,
          size: 18,
          color: customTheme.primaryTextColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
