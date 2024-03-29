import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/conditional_async_wrapper.dart';
import 'package:personal_finance_management_app/ui/components/transaction_list_item.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:personal_finance_management_app/ui/views/main/main_viewmodel.dart';
import 'package:personal_finance_management_app/ui/views/transaction/recent_transactions/recent_transactions_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RecentTransactionsView extends StatelessWidget {
  const RecentTransactionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;
    final mainViewModel = getParentViewModel<MainViewModel>(context);

    return ViewModelBuilder<RecentTransactionsViewModel>.reactive(
      viewModelBuilder: () => RecentTransactionsViewModel(),
      builder: (context, model, child) => Card(
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
            ConditionalAsyncWrapper(
              isLoading: !model.recentTransactionsReady,
              showFallback: model.recentTransactions.isEmpty,
              fallback: Center(
                child: ThemeText.listItemTitle(
                  "No transaction available",
                  color: customTheme.subTitleColor,
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.recentTransactions.length,
                itemBuilder: (BuildContext context, int index) {
                  final transaction = model.recentTransactions[index];
                  return TransactionListItem(
                    transaction: transaction,
                    onTap: () => model.navigateToTransactionDetailEditMode(transaction),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => mainViewModel.setIndex(0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 8,
                          ),
                          child: ThemeText.listItemSubTitle(
                            'SHOW MORE',
                            color: customTheme.primaryAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
