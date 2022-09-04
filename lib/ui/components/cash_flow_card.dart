import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

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
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Cash Flow',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Last 30 Days',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              trailing: Icon(
                Icons.more_vert_outlined,
                size: 18,
                color: customTheme.primaryTextColor,
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
                    Icons.arrow_drop_up,
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
                  const SizedBox(height: 10),
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
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: customTheme.primaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 14,
                color: customTheme.primaryTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
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
