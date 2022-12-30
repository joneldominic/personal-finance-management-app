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

    return ViewModelBuilder<AccountSettingsViewModel>.reactive(
      viewModelBuilder: () => AccountSettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          icon: const Icon(Icons.add_rounded),
          label: "Add Account",
          onPressed: () => model.navigateToAccountDetail(null),
        ),
        appBar: const CustomAppBar(
          title: Text("Account Settings"),
        ),
        body: Container(
          color: customTheme.contrastBackgroundColor,
          child: model.isBusy
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  // TODO: Add handling for empty list
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 90),
                  physics: const BouncingScrollPhysics(),
                  itemCount: model.accounts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AccountListItem(
                      accountName: model.accounts[index].name,
                      color: model.accounts[index].color!,
                      currency: model.accounts[index].currency,
                      amount: model.accounts[index].balance,
                      onPressed: () =>
                          model.navigateToAccountDetail(model.accounts[index]),
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
