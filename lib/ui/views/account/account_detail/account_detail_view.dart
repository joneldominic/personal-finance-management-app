import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/custom_color_picker.dart';
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

    final isAddAccount = account == null;
    final appBarTitle = isAddAccount ? "New Account" : "Edit Account";
    final actionButtonTooltip = isAddAccount ? "Save New Account" : "Save Changes";
    final balanceFieldLabel = isAddAccount ? "Initial Balance" : "Balance";

    return ViewModelBuilder<AccountDetailViewModel>.reactive(
      viewModelBuilder: () => AccountDetailViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.initForm(
          account: account,
          accountNameController: accountNameController,
          balanceController: balanceController,
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
            if (!isAddAccount) ...[
              IconButton(
                icon: const Icon(Icons.delete_rounded),
                tooltip: actionButtonTooltip,
                onPressed: () => model.handleDeleteAccount(),
              ),
            ],
            IconButton(
              icon: const Icon(Icons.check_rounded),
              tooltip: actionButtonTooltip,
              onPressed: () => model.handleSaveAccount(),
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
                  decoration: InputDecoration(
                    labelText: 'Account Name',
                    errorText: model.hasAccountNameValidationMessage
                        ? model.accountNameValidationMessage
                        : null,
                  ),
                  controller: accountNameController,
                ),
                DropdownButtonFormField(
                  key: const ValueKey(CurrencyValueKey),
                  decoration: const InputDecoration(
                    labelText: 'Currency',
                  ),
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
                  onChanged: (String? value) => model.setAccountCurrency(value!),
                ),
                TextField(
                  key: const ValueKey(BalanceValueKey),
                  decoration: InputDecoration(
                    labelText: balanceFieldLabel,
                  ),
                  controller: balanceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [model.currencyInputFormatter!],
                ),
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
                ],
              ],
            ),
          ),
        ),
      ),
    );
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
