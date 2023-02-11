import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:personal_finance_management_app/ui/views/main/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CashFlowCard extends StatelessWidget {
  const CashFlowCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;
    final mainViewModel = getParentViewModel<MainViewModel>(context);

    final cashFlow =
        mainViewModel.cashFlowReady ? mainViewModel.cashFlow : CashFlow(id: CASH_FLOW_ID);
    final isPositiveFlow = cashFlow.net! >= 0;

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
                    doubleToCurrencyFormatter(
                      currency: "₱",
                      value: cashFlow.net!,
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: isPositiveFlow ? customTheme.customGreen : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    isPositiveFlow ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
                    size: 32,
                    color: isPositiveFlow ? customTheme.customGreen : Colors.red,
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
                    doubleToCurrencyFormatter(
                      currency: "₱",
                      value: cashFlow.income!,
                    ),
                    cashFlow.incomePercentage!,
                  ),
                  verticalSpaceSmall,
                  _buildCashFlowBar(
                    customTheme,
                    TransactionType.expense,
                    doubleToCurrencyFormatter(
                      currency: "₱",
                      value: cashFlow.expenses!,
                    ),
                    cashFlow.expensesPercentage!,
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
    final label = transactionType == TransactionType.income ? "Income" : "Expenses";

    final color = transactionType == TransactionType.income ? customTheme.customGreen : Colors.red;

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
