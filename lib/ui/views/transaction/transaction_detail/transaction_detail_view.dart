import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
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
    name: 'accountId',
    items: [],
  ),
  FormDropdownField(
    name: 'destinationAccountId',
    items: [],
  ),
  FormDropdownField(
    name: 'transactionType',
    items: transactionTypeStaticDropdownItems,
  ),
  FormTextField(initialValue: '', name: 'amount'),
  FormDropdownField(
    name: 'categoryId',
    items: [],
  ),
  FormTextField(initialValue: '', name: 'notes'),
])
class TransactionDetailView extends StatelessWidget with $TransactionDetailView {
  TransactionDetailView({
    Key? key,
    this.transaction,
  }) : super(key: key);

  final Transaction? transaction;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final isAddTransaction = transaction == null;
    final appBarTitle = isAddTransaction ? "New Transaction" : "Transaction Detail";
    final actionButtonTooltip = isAddTransaction ? "Save Transaction" : "Save Changes";

    return ViewModelBuilder<TransactionDetailViewModel>.reactive(
      viewModelBuilder: () => TransactionDetailViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.initForm(
          transaction: transaction,
          amountController: amountController,
          notesController: notesController,
        );
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
            if (!isAddTransaction) ...[
              IconButton(
                icon: const Icon(Icons.delete_rounded),
                tooltip: actionButtonTooltip,
                onPressed: model.handleDeleteTransaction,
              ),
            ],
            IconButton(
              icon: const Icon(Icons.check_rounded),
              tooltip: actionButtonTooltip,
              onPressed: model.disableSave ? null : () => model.handleSaveTransaction(),
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
                  key: const ValueKey(AccountIdValueKey),
                  value: model.accountIdValue,
                  decoration: InputDecoration(
                    label: const Text("Account"),
                    errorText: model.accounts.isEmpty ? model.emptyAccountErrorMessage : null,
                  ),
                  items: model.accounts
                      .map(
                        (account) => DropdownMenuItem<String>(
                          key: ValueKey('${account.id} key'),
                          value: account.id.toString(),
                          child: Text(account.name ?? ""),
                        ),
                      )
                      .toList(),
                  focusNode: model.accountFocusNode,
                  onChanged: (String? value) => model.handleAccountChange(value!),
                ),
                DropdownButtonFormField(
                  key: const ValueKey(TransactionTypeValueKey),
                  value: model.transactionTypeValue,
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
                  onChanged: (String? value) => model.handleTransactionTypeChange(value!),
                ),
                if (model.transactionTypeValue ==
                    EnumToString.convertToString(TransactionType.transfer)) ...[
                  DropdownButtonFormField(
                    key: const ValueKey(DestinationAccountIdValueKey),
                    value: model.destinationAccountId,
                    decoration: InputDecoration(
                      label: const Text("Destination Account"),
                      errorText:
                          model.destinationAccounts.isEmpty ? model.emptyAccountErrorMessage : null,
                    ),
                    items: model.destinationAccounts
                        .map(
                          (account) => DropdownMenuItem<String>(
                            key: ValueKey('${account.id} key'),
                            value: account.id.toString(),
                            child: Text(account.name ?? ""),
                          ),
                        )
                        .toList(),
                    focusNode: model.destinationAccountFocusNode,
                    onChanged: (String? value) => model.handleDestinationAccountChange(value!),
                  ),
                ],
                TextField(
                  key: const ValueKey(AmountValueKey),
                  decoration: InputDecoration(
                    labelText: "Amount",
                    prefix: model.showNegativeAmountPrefix() ? const Text('-') : null,
                  ),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [model.currencyInputFormatter],
                  focusNode: model.amountFieldFocusNode,
                ),
                DropdownButtonFormField(
                  key: const ValueKey(CategoryIdValueKey),
                  value: model.categoryIdValue,
                  decoration: InputDecoration(
                    label: const Text("Category"),
                    errorText: model.categories.isEmpty ? model.emptyCategoryErrorMessage : null,
                  ),
                  items: model.filteredCategories
                      .map(
                        (category) => DropdownMenuItem<String>(
                          key: ValueKey('$category key'),
                          value: category.id.toString(),
                          child: Text(category.name ?? ""),
                        ),
                      )
                      .toList(),
                  onChanged: model.disableCategoryField
                      ? null
                      : (String? value) => model.setCategoryId(value!),
                ),
                TextField(
                  readOnly: true,
                  key: const ValueKey("date"),
                  controller: model.dateController,
                  onTap: () => model.setTransactionDate(context),
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_drop_down_sharp),
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
                  onTap: () => model.setTransactionTime(context),
                  decoration: InputDecoration(
                    labelText: 'Time',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_drop_down_sharp),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
