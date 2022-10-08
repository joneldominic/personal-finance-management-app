import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/account_enum.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/custom_color_picker.dart';
import 'package:personal_finance_management_app/ui/components/delete_button.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/account/account_detail/account_detail_view.form.dart';
import 'package:personal_finance_management_app/ui/views/account/account_detail/account_detail_viewmodel.dart';
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
  FormTextField(initialValue: '', name: 'newBalance'),
  FormDropdownField(
    name: 'color',
    items: colorStaticDropdownItems,
  ),
])
class AccountDetailView extends StatelessWidget with $AccountDetailView {
  AccountDetailView({
    Key? key,
    this.account,
  }) : super(key: key);

  final Account? account;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final appBarTitle = account == null ? "New Account" : "Edit Account";
    final actionButtonTooltip =
        account == null ? "Save New Account" : "Save Changes";
    final balanceFieldLabel = account == null ? "Initial Balance" : "Balance";

    return ViewModelBuilder<AccountDetailViewModel>.reactive(
      viewModelBuilder: () => AccountDetailViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.initForm(
          account: account,
          accountNameController: accountNameController,
          balanceController: balanceController,
          newBalanceController: newBalanceController,
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
            IconButton(
              icon: const Icon(Icons.save_rounded),
              tooltip: actionButtonTooltip,
              onPressed: () => model.saveAccount(account),
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
                  readOnly: account != null,
                  key: const ValueKey(BalanceValueKey),
                  decoration: InputDecoration(
                    labelText: balanceFieldLabel,
                    suffixIcon: account == null
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.edit_rounded),
                            iconSize: 20,
                            color: customTheme.actionButtonColor,
                            onPressed: () =>
                                model.setNewBalanceFormVisibility(true),
                          ),
                  ),
                  controller: balanceController,
                  keyboardType: TextInputType
                      .number, // TODO: Improve filter (don't allow multiple period); Improve formatting with comma
                ),
                if (account != null && model.newBalanceFormIsVisible) ...[
                  verticalSpaceRegular,
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), // if you need this
                      side: BorderSide(
                        color: customTheme.customLightGrey!,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(children: [
                            const Expanded(child: Text("New Balance")),
                            IconButton(
                              icon: const Icon(Icons.close_rounded),
                              iconSize: 20,
                              onPressed: () =>
                                  model.setNewBalanceFormVisibility(false),
                            ),
                            IconButton(
                              icon: const Icon(Icons.check_rounded),
                              iconSize: 20,
                              onPressed: () {},
                            ),
                          ]),
                          TextField(
                            key: const ValueKey(NewBalanceValueKey),
                            controller: newBalanceController,
                            keyboardType: TextInputType
                                .number, // TODO: Improve filter (don't allow multiple period); Improve formatting with comma
                          ),
                          verticalSpaceSmall,
                          _buildRadioListTile(
                            title:
                                'Record changes with a Transaction (diff amount)',
                            value: BalanceUpdateType.withRecord,
                            groupValue: model.balanceUpdateType,
                            onChanged: model.setBalanceUpdateType,
                            theme: customTheme,
                          ),
                          _buildRadioListTile(
                            title: 'Update balance without a Transaction',
                            value: BalanceUpdateType.withoutRecord,
                            groupValue: model.balanceUpdateType,
                            onChanged: model.setBalanceUpdateType,
                            theme: customTheme,
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                ],
                CustomColorPicker(
                  key: const ValueKey(ColorValueKey),
                  value: model.colorValue,
                  colorValueToTitleMap: ColorValueToTitleMap,
                  onPressed: (String? value) => model.setColor(value!),
                ),
                verticalSpaceSmallPlus,
                _buildSwitchListTile(
                  title: 'Exclude from Analysis',
                  value: model.isExcludeFromAnalysis,
                  onChanged: model.setIsExcludeFromAnalysis,
                  theme: customTheme,
                ),
                if (account != null) ...[
                  _buildSwitchListTile(
                    title: 'Archive Account',
                    value: model.isArchivedAccount,
                    onChanged: model.setIsArchivedAccount,
                    theme: customTheme,
                  ),
                  verticalSpaceRegular,
                  DeleteButton(
                    label: 'Delete Account',
                    onPressed: () {},
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  RadioListTile<BalanceUpdateType> _buildRadioListTile({
    required String title,
    required BalanceUpdateType value,
    required BalanceUpdateType groupValue,
    required CustomTheme theme,
    required void Function(BalanceUpdateType?)? onChanged,
  }) {
    return RadioListTile<BalanceUpdateType>(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: theme.activeControlColor);
  }

  SwitchListTile _buildSwitchListTile({
    required String title,
    required bool value,
    required CustomTheme theme,
    required void Function(bool)? onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      visualDensity: VisualDensity.compact,
      activeColor: theme.activeControlColor,
      activeTrackColor: theme.activeSwitchTrackColor,
      value: value,
      onChanged: onChanged,
    );
  }
}
