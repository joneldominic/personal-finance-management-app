import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class AccountThumbnail extends StatelessWidget {
  const AccountThumbnail({
    Key? key,
    this.label,
    this.amount,
    this.color,
    this.isAddAccount = false,
  }) : super(key: key);

  final String? label;
  final String? amount;
  final Color? color;
  final bool isAddAccount;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isAddAccount ? customTheme.primaryAccent : color,
      ),
      child: _buildChild(),
    );
  }

  Column _buildChild() {
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
                  Icons.add_circle_outline_outlined,
                  color: Colors.white,
                )
              ],
            )
          ]
        : [
            Text(
              label ?? "",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              amount ?? "",
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
