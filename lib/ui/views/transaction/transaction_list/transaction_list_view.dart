import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/conditional_async_wrapper.dart';
import 'package:personal_finance_management_app/ui/components/transaction_list_item.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:personal_finance_management_app/ui/views/main/main_viewmodel.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_list/transaction_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;
    final mainViewModel = getParentViewModel<MainViewModel>(context);

    return ViewModelBuilder<TransactionListViewModel>.reactive(
      viewModelBuilder: () => TransactionListViewModel(),
      builder: (context, model, child) => Container(
        color: customTheme.contrastBackgroundColor,
        child: ConditionalAsyncWrapper(
          isLoading: !mainViewModel.transactionsReady,
          showFallback: mainViewModel.transactions.isEmpty,
          fallback: Center(
            child: ThemeText.listItemTitle(
              "No transaction available",
              color: customTheme.subTitleColor,
            ),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(7, 10, 7, 90),
            physics: const BouncingScrollPhysics(),
            itemCount: mainViewModel.transactions.length,
            itemBuilder: (BuildContext context, int index) {
              final transaction = mainViewModel.transactions[index];
              return TransactionListItem(
                transaction: transaction,
                onTap: () => model.navigateToTransactionDetailEditMode(transaction),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
