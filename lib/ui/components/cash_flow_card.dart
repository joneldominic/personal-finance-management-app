import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class CashFlowCard extends StatelessWidget {
  const CashFlowCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ThemeText.cardTitle("Cash Flow"),
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
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                children: [
                  Text(
                    'PHP 9,057.92',
                    style: TextStyle(
                      fontSize: 18,
                      color: customTheme.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_up_rounded,
                    size: 32,
                    color: customTheme.success,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Column(
                children: [
                  _buildCashFlowBar(
                    customTheme,
                    TransactionType.income,
                    "PHP 49,125.51",
                    1.0,
                  ),
                  verticalSpaceSmall,
                  _buildCashFlowBar(
                    customTheme,
                    TransactionType.expense,
                    "-PHP 40,067.59",
                    0.8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildCashFlowBar(
    CustomTheme customTheme,
    TransactionType transactionType,
    String amount,
    double value,
  ) {
    final label =
        transactionType == TransactionType.income ? "Income" : "Expenses";

    final color = transactionType == TransactionType.income
        ? customTheme.customGreen
        : Colors.red;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ThemeText.listItemTitle(
              label,
              color: customTheme.primaryTextColor,
            ),
            ThemeText.listItemTitle(
              amount,
              color: customTheme.primaryTextColor,
            ),
          ],
        ),
        verticalSpaceTiny,
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 15,
            color: color,
            backgroundColor: customTheme.customGrey,
          ),
        )
      ],
    );
  }
}
