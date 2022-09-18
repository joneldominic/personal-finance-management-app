import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/transaction_list_item.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Last 30 Days',
                  style: TextStyle(
                    fontSize: 12,
                    color: customTheme.customLightGrey,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              iconSize: 20,
              color: customTheme.actionButtonColor,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: Column(
              children: [
                TransactionListItem(
                  description: "Birthday",
                  accountName: "Cash",
                  amount: "PHP 5,000.00",
                  transactionType: TransactionType.expense,
                  timeStamp: "Today",
                  onTap: () {},
                ),
                const Divider(),
                TransactionListItem(
                  description: "Badminton Tournament Registration",
                  accountName: "Cash",
                  amount: "PHP 800.00",
                  transactionType: TransactionType.expense,
                  timeStamp: "Sept. 2, 2022",
                  onTap: () {},
                ),
                const Divider(),
                TransactionListItem(
                  description: "FullScale Salary",
                  accountName: "BPI",
                  amount: "PHP 60,000.00",
                  transactionType: TransactionType.income,
                  timeStamp: "Aug. 30, 2022",
                  onTap: () {},
                ),
                const Divider(),
                TransactionListItem(
                  description: "Grocery",
                  accountName: "Cash",
                  amount: "PHP 2,000.00",
                  transactionType: TransactionType.expense,
                  timeStamp: "Aug. 24, 2022",
                  onTap: () {},
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'SHOW MORE',
                      style: TextStyle(
                        fontSize: 12,
                        color: customTheme.primaryAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
