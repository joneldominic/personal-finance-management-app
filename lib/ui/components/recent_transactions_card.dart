import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/transaction_list_item.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    // TODO: Handle data here dynamically

    // TODO: Add filter (ex. Last 30 Days)

    // TODO: Handle show more

    // TODO: Implement action button - choose timeframe

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ThemeText.cardTitle("Recent Transactions"),
                ThemeText.cardSubTitle('Last 30 Days'),
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
                  categoryName: "Birthday",
                  accountName: "Cash",
                  amount: 5000,
                  transactionType: TransactionType.expense,
                  timeStamp: DateTime.now(),
                  onTap: () {},
                ),
                const Divider(),
                TransactionListItem(
                  categoryName: "Badminton Tournament Registration",
                  accountName: "Cash",
                  amount: 800,
                  transactionType: TransactionType.expense,
                  timeStamp: DateTime.now(),
                  onTap: () {},
                ),
                const Divider(),
                TransactionListItem(
                  categoryName: "FullScale Salary",
                  accountName: "BPI",
                  amount: 0,
                  transactionType: TransactionType.income,
                  timeStamp: DateTime.now(),
                  onTap: () {},
                ),
                const Divider(),
                TransactionListItem(
                  categoryName: "Grocery",
                  accountName: "Cash",
                  amount: 0,
                  transactionType: TransactionType.expense,
                  timeStamp: DateTime.now(),
                  onTap: () {},
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ThemeText.listItemSubTitle(
                      'SHOW MORE',
                      color: customTheme.primaryAccent,
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
