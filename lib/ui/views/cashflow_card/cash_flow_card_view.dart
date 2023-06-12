import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/time_period.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';
import 'package:personal_finance_management_app/ui/components/generic_pop_up_menu_button.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:personal_finance_management_app/ui/views/cashflow_card/cash_flow_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CashFlowCardView extends StatelessWidget {
  const CashFlowCardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<CashFlowCardViewModel>.reactive(
      viewModelBuilder: () => CashFlowCardViewModel(),
      builder: (context, model, child) {
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
                    children: [
                      const ThemeText.cardTitle("Cash Flow"),
                      ThemeText.cardSubTitle(TimePeriodHelper.getTitleByDaysCount(
                        model.cashFlow.daysCount!,
                      )),
                    ],
                  ),
                  trailing: GenericPopupMenuButton<TimePeriod>(
                    items: TIME_PERIOD_MENU_ITEMS_LONG,
                    onItemSelected: model.onSelectTimePeriod,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    children: [
                      _buildAmountDisplay(customTheme, model.cashFlow),
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
                          value: model.cashFlow.income!,
                        ),
                        model.cashFlow.incomePercentage!,
                      ),
                      verticalSpaceSmall,
                      _buildCashFlowBar(
                        customTheme,
                        TransactionType.expense,
                        doubleToCurrencyFormatter(
                          currency: "₱",
                          value: model.cashFlow.expenses!,
                        ),
                        model.cashFlow.expensesPercentage!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAmountDisplay(
    CustomTheme customTheme,
    CashFlow cashFlow,
  ) {
    final isPositive = cashFlow.net! > 0;
    final color = cashFlow.net == 0
        ? Colors.grey
        : isPositive
            ? customTheme.customGreen
            : Colors.red;
    final icon = cashFlow.net == 0
        ? Icons.horizontal_rule_rounded
        : isPositive
            ? Icons.arrow_drop_up_rounded
            : Icons.arrow_drop_down_rounded;

    return Row(children: [
      Text(
        doubleToCurrencyFormatter(
          currency: "₱",
          value: cashFlow.net!,
        ),
        style: TextStyle(
          fontSize: 18,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
      Icon(
        icon,
        size: 32,
        color: color,
      )
    ]);
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
