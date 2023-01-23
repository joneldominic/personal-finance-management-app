import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/category_list_item.dart';
import 'package:personal_finance_management_app/ui/components/conditional_async_wrapper.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/custom_floating_action_button.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/category/category_list/category_list_viewmodel.dart';
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

    return ViewModelBuilder<CategoryListViewModel>.reactive(
      viewModelBuilder: () => CategoryListViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          icon: const Icon(Icons.add_rounded),
          label: "Add Category",
          onPressed: () => model.navigateToCategoryDetail(null),
        ),
        appBar: const CustomAppBar(
          title: Text("Categories"),
        ),
        body: Container(
          color: customTheme.contrastBackgroundColor,
          child: ConditionalAsyncWrapper(
            isLoading: model.isBusy,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 90),
              physics: const BouncingScrollPhysics(),
              itemCount: model.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryListItem(
                  categoryName: model.categories[index].name!,
                  categoryNature: model.categories[index].nature!,
                  color: Color(
                    int.parse(model.categories[index].color!),
                  ),
                  onPressed: () => model.navigateToCategoryDetail(
                    model.categories[index],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ),
      ),
    );
  }
}
