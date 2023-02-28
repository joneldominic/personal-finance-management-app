import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class AccountThumbnail extends StatelessWidget {
  const AccountThumbnail({
    Key? key,
    this.account,
    this.isAddAccount = false,
    required this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Account? account;
  final bool isAddAccount;
  final void Function() onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final color = account != null && account!.isSelected!
        ? Color(
            int.parse(
              account!.color!,
            ),
          )
        : Colors.grey;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Ink(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isAddAccount ? customTheme.primaryAccent : color,
        ),
        child: _buildChild(),
      ),
    );
  }

  Column _buildChild() {
    final amount = doubleToCurrencyFormatter(
      currency: account?.currency ?? "₱",
      value: account?.balance ?? 0,
    );

    List<Widget> children = isAddAccount
        ? [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "New\nAccount",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.white,
                )
              ],
            )
          ]
        : [
            Text(
              account?.name ?? "",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              amount,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ];

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children);
  }
}
