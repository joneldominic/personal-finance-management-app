import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/account_list_item.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/custom_floating_action_button.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/account/account_settings/account_settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final List<Color> colors = <Color>[
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.blue,
    ];

    final List<String> accountNames = <String>[
      'Cash',
      'GCash',
      'BPI',
      'Cash',
      'GCash',
      'BPI',
      'Cash',
      'GCash',
      'BPI',
      'Cash',
      'GCash',
      'BPI',
    ];

    final List<String> amounts = <String>[
      "PHP 5,000.00",
      "PHP 800.00",
      "PHP 60,000.00",
      "PHP 5,000.00",
      "PHP 800.00",
      "PHP 60,000.00",
      "PHP 5,000.00",
      "PHP 800.00",
      "PHP 60,000.00",
      "PHP 5,000.00",
      "PHP 800.00",
      "PHP 60,000.00",
    ];

    return ViewModelBuilder<AccountSettingsViewModel>.nonReactive(
      viewModelBuilder: () => AccountSettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          icon: const Icon(Icons.add_rounded),
          label: "Add Account",
          onPressed: model.navigateToAccountDetails,
        ),
        appBar: const CustomAppBar(
          title: Text("Account Settings"),
        ),
        body: Container(
          color: customTheme.contrastBackgroundColor,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 90),
            physics: const BouncingScrollPhysics(),
            itemCount: accountNames.length,
            itemBuilder: (BuildContext context, int index) {
              return AccountListItem(
                accountName: accountNames[index],
                color: colors[index],
                amount: amounts[index],
                onPressed: () =>
                    model.navigateToAccountDetails(isAddAccount: false),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
