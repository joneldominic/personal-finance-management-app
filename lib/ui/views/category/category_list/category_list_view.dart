import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/category_nature.dart';
import 'package:personal_finance_management_app/ui/components/category_list_item.dart';
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

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

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

    final List<String> categoryNames = <String>[
      'Foods',
      'Shopping',
      'Housing',
      'Foods',
      'Shopping',
      'Housing',
      'Foods',
      'Shopping',
      'Housing',
      'Foods',
      'Shopping',
      'Housing',
    ];

    final List<CategoryNature> categoryNatures = <CategoryNature>[
      CategoryNature.need,
      CategoryNature.want,
      CategoryNature.none,
      CategoryNature.need,
      CategoryNature.want,
      CategoryNature.none,
      CategoryNature.need,
      CategoryNature.want,
      CategoryNature.none,
      CategoryNature.need,
      CategoryNature.want,
      CategoryNature.none,
    ];

    return ViewModelBuilder<AccountSettingsViewModel>.nonReactive(
        viewModelBuilder: () => AccountSettingsViewModel(),
        builder: (context, model, child) => Scaffold(
              floatingActionButton: CustomFloatingActionButton(
                icon: const Icon(Icons.add_rounded),
                label: "Add Category",
                onPressed: model
                    .navigateToAccountDetails, // TODO: Redirect to Category Detail, Add Mode
              ),
              appBar: const CustomAppBar(
                title: Text("Categories"),
              ),
              body: Container(
                color: customTheme.contrastBackgroundColor,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 90),
                  physics: const BouncingScrollPhysics(),
                  itemCount: categoryNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryListItem(
                        categoryName: categoryNames[index],
                        categoryNature: categoryNatures[index],
                        color: colors[index],
                        onPressed: () =>
                            {} // TODO: Redirect to Category Detail, Edit Mode
                        // model.navigateToAccountDetails(isAddAccount: false),
                        );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ));
  }
}
