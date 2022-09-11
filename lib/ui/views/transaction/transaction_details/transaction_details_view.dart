import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/account_enum.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_details/transaction_details_view.form.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_details/transaction_details_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

@FormView(fields: [
  FormTextField(initialValue: '', name: 'accountName'),
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
class TransactionDetailsView extends StatelessWidget
    with $TransactionDetailsView {
  TransactionDetailsView({
    Key? key,
    this.isAddTransaction = true,
  }) : super(key: key);

  final bool isAddTransaction;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final appBarTitle =
        isAddTransaction ? "New Transaction" : "Transaction Details";
    final actionButtonTooltip =
        isAddTransaction ? "Save Transaction" : "Save Changes";

    return ViewModelBuilder<TransactionDetailsViewModel>.reactive(
      viewModelBuilder: () => TransactionDetailsViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        // model.initForm(
        //   accountNameController: accountNameController,
        //   balanceController: balanceController,
        //   newBalanceController: newBalanceController,
        // );
      },
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: customTheme.appBarBackgroundColor,
          title: Text(appBarTitle),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: model.popCurrentView,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
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
                TextField(
                  key: const ValueKey(AccountNameValueKey),
                  decoration: const InputDecoration(labelText: 'Account Name'),
                  controller: accountNameController,
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
                  // value: model.currencyValue,
                  decoration: const InputDecoration(
                    label: Text("Budget Category"),
                  ),
                  items: TransactionTypeValueToTitleMap.keys
                      .map(
                        // TODO: Fetch from dummy category list
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
                  readOnly: true,
                  key: const ValueKey("date"),
                  controller: model.dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.edit),
                      color: customTheme.primaryTextColor,
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
                      icon: const Icon(Icons.edit),
                      color: customTheme.primaryTextColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}