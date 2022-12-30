import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/transaction_list_item.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_list/transaction_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<TransactionListViewModel>.reactive(
      viewModelBuilder: () => TransactionListViewModel(),
      builder: (context, model, child) => Container(
        color: customTheme.contrastBackgroundColor,
        child: !model.streamDataReady
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(7, 10, 7, 90),
                physics: const BouncingScrollPhysics(),
                itemCount: model.transactions.length,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionListItem(
                    categoryName: model.transactions[index].categoryName,
                    categoryColor: model.transactions[index].categoryColor,
                    accountName: model.transactions[index].accountName,
                    accountCurrency: model.transactions[index].accountCurrency,
                    amount: model.transactions[index].amount,
                    transactionType: model.transactions[index].transactionType,
                    timeStamp: model.transactions[index].date,
                    onTap: model.navigateToTransactionDetailEditMode,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
      ),
    );
  }
}
