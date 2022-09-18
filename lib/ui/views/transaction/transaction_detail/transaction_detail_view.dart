import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/delete_button.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_view.form.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

@FormView(fields: [
  FormDropdownField(
    name: 'accountName',
    items: [],
  ),
  FormDropdownField(
    name: 'transactionType',
    items: transactionTypeStaticDropdownItems,
  ),
  FormTextField(initialValue: '', name: 'amount'),
  FormDropdownField(
    name: 'category',
    items: [],
  ),
  FormTextField(initialValue: '', name: 'notes'),
])
class TransactionDetailView extends StatelessWidget
    with $TransactionDetailView {
  TransactionDetailView({
    Key? key,
    this.isAddTransaction = true,
  }) : super(key: key);

  final bool isAddTransaction;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final appBarTitle =
        isAddTransaction ? "New Transaction" : "Transaction Detail";
    final actionButtonTooltip =
        isAddTransaction ? "Save Transaction" : "Save Changes";

    return ViewModelBuilder<TransactionDetailViewModel>.reactive(
      viewModelBuilder: () => TransactionDetailViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.initForm();
      },
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: model.popCurrentView,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save_rounded),
              tooltip: actionButtonTooltip,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: customTheme.contrastBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
            child: Column(
              children: [
                DropdownButtonFormField(
                  key: const ValueKey(AccountNameValueKey),
                  value: model.accountNameValue,
                  decoration: const InputDecoration(
                    label: Text("Account Name"),
                  ),
                  items: model.dummyAccounts
                      .map(
                        (value) => DropdownMenuItem<String>(
                          key: ValueKey('$value key'),
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {},
                ),
                DropdownButtonFormField(
                  key: const ValueKey(TransactionTypeValueKey),
                  // value: model.currencyValue,
                  decoration: const InputDecoration(
                    label: Text("Transaction Type"),
                  ),
                  items: TransactionTypeValueToTitleMap.keys
                      .map(
                        (value) => DropdownMenuItem<String>(
                          key: ValueKey('$value key'),
                          value: value,
                          child: Text(TransactionTypeValueToTitleMap[value]!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {},
                ),
                TextField(
                  key: const ValueKey(AmountValueKey),
                  decoration: const InputDecoration(labelText: "Amount"),
                  controller: amountController,
                  keyboardType: TextInputType
                      .number, // TODO: Improve filter (don't allow multiple period); Improve formatting with comma
                ),
                DropdownButtonFormField(
                  key: const ValueKey(CategoryValueKey),
                  value: model.categoryValue,
                  decoration: const InputDecoration(
                    label: Text("Category"),
                  ),
                  items: model.dummyCategory
                      .map(
                        (value) => DropdownMenuItem<String>(
                          key: ValueKey('$value key'),
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {},
                ),
                TextField(
                  readOnly: true,
                  key: const ValueKey("date"),
                  controller: model.dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.edit_rounded),
                      iconSize: 20,
                      color: customTheme.actionButtonColor,
                      onPressed: () => model.setTransactionDate(context),
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  key: const ValueKey("time"),
                  controller: model.timeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.edit_rounded),
                      iconSize: 20,
                      color: customTheme.actionButtonColor,
                      onPressed: () => model.setTransactionTime(context),
                    ),
                  ),
                ),
                TextField(
                  key: const ValueKey(NotesValueKey),
                  decoration: const InputDecoration(labelText: 'Notes'),
                  controller: notesController,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                ),
                if (!isAddTransaction) ...[
                  verticalSpaceRegular,
                  DeleteButton(
                    label: 'Delete Transaction',
                    onPressed: () {},
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
