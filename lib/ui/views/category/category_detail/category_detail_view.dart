import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/account_enum.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/custom_color_picker.dart';
import 'package:personal_finance_management_app/ui/components/delete_button.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/category/category_detail/category_detail_view.form.dart';
import 'package:personal_finance_management_app/ui/views/category/category_detail/category_detail_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

@FormView(fields: [
  FormTextField(initialValue: '', name: 'categoryName'),
  FormDropdownField(
    name: 'categoryNature',
    items: categoryNatureStaticDropdownItems,
  ),
  FormDropdownField(
    name: 'color',
    items: colorStaticDropdownItems,
  ),
])
class CategoryDetailView extends StatelessWidget with $CategoryDetailView {
  CategoryDetailView({
    Key? key,
    this.isAddCategory = true,
  }) : super(key: key);

  final bool isAddCategory;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final appBarTitle = isAddCategory ? "New Category" : "Edit Category";
    final actionButtonTooltip =
        isAddCategory ? "Save New Category" : "Save Changes";
    final balanceFieldLabel = isAddCategory ? "Initial Balance" : "Balance";

    return ViewModelBuilder<CategoryDetailViewModel>.reactive(
      viewModelBuilder: () => CategoryDetailViewModel(),
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
                TextField(
                  key: const ValueKey(CategoryNameValueKey),
                  decoration: const InputDecoration(labelText: 'Category Name'),
                  controller: categoryNameController,
                ),
                DropdownButtonFormField(
                  key: const ValueKey(CategoryNatureValueKey),
                  value: model.categoryNatureValue,
                  items: CategoryNatureValueToTitleMap.keys
                      .map(
                        (value) => DropdownMenuItem<String>(
                          key: ValueKey('$value key'),
                          value: value,
                          child: Text(CategoryNatureValueToTitleMap[value]!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {},
                ),
                CustomColorPicker(
                  key: const ValueKey(ColorValueKey),
                  value: model.colorValue,
                  colorValueToTitleMap: ColorValueToTitleMap,
                  onPressed: (String? value) => model.setColor(value!),
                ),
                verticalSpaceSmallPlus,
                _buildSwitchListTile(
                  title: 'Visibility',
                  value: model.categoryIsVisible,
                  onChanged: model.setCategoryVisibility,
                  theme: customTheme,
                ),
                if (!isAddCategory) ...[
                  verticalSpaceRegular,
                  DeleteButton(
                    label: 'Delete Category',
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
          style: const TextStyle(fontSize: 14),
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
