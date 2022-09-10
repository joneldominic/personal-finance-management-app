import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/account/account_details/account_details_view.form.dart';
import 'package:personal_finance_management_app/ui/views/account/account_details/account_details_viewmodel.dart';
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
    name: 'currency',
    items: currencyStaticDropdownItems,
  ),
  FormTextField(initialValue: '', name: 'balance'),
  FormDropdownField(
    name: 'color',
    items: colorStaticDropdownItems,
  ),
])
class AccountDetailsView extends StatelessWidget with $AccountDetailsView {
  AccountDetailsView({Key? key}) : super(key: key);

  // TODO: Wrap with scrollable
  // TODO: Breakdown components into builders
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<AccountDetailsViewModel>.nonReactive(
      viewModelBuilder: () => AccountDetailsViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.initForm(
            accountNameController: accountNameController,
            balanceController: balanceController);
      },
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: customTheme.appBarBackgroundColor,
          title: const Text("New Account"),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: model.popCurrentView,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              tooltip:
                  'Save New Account', // TODO: Conditionally render message for update
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          color: customTheme.contrastBackgroundColor,
          child: Column(
            children: [
              TextField(
                key: const ValueKey(AccountNameValueKey),
                decoration: const InputDecoration(labelText: 'Account Name'),
                controller: accountNameController,
              ),
              DropdownButtonFormField(
                key: const ValueKey(CurrencyValueKey),
                value: model.currencyValue,
                items: CurrencyValueToTitleMap.keys
                    .map(
                      (value) => DropdownMenuItem<String>(
                        key: ValueKey('$value key'),
                        value: value,
                        child: Text(CurrencyValueToTitleMap[value]!),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {},
              ),
              TextField(
                key: const ValueKey(BalanceValueKey),
                decoration: const InputDecoration(
                    labelText:
                        'Initial Balance'), // TODO: Conditionally render message for update

                controller: balanceController,
                keyboardType: TextInputType
                    .number, // TODO: Improve filter (don't allow multiple period); Improve formatting with comma
              ),
              DropdownButtonFormField(
                key: const ValueKey(ColorValueKey),
                value: model.colorValue,
                menuMaxHeight:
                    screenHeightPercentage(context, percentage: 0.30),
                borderRadius: BorderRadius.circular(5),
                decoration: const InputDecoration(
                  label: Text("Color"),
                ),
                selectedItemBuilder: (context) =>
                    ColorValueToTitleMap.keys.map<Widget>((value) {
                  return Container(
                    height: 30,
                    width: screenWidth(context) - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(
                        int.parse(ColorValueToTitleMap[value]!),
                      ),
                    ),
                  );
                }).toList(),
                items: ColorValueToTitleMap.keys
                    .map(
                      (value) => DropdownMenuItem<String>(
                        key: ValueKey('$value key'),
                        value: value,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(
                              int.parse(ColorValueToTitleMap[value]!),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) => model.setColor(value!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
