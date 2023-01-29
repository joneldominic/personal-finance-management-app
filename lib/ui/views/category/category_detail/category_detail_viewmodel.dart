import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/category_nature.dart';
import 'package:personal_finance_management_app/core/enums/dialog_type.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/services/category_service.dart';
import 'package:personal_finance_management_app/ui/views/category/category_detail/category_detail_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class CategoryDetailViewModel extends FormViewModel {
  final _logger = getLogger('CategoryDetailViewModel');
  final _navigationService = locator<NavigationService>();
  final _categoryService = locator<CategoryService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();

  Category? _category;

  TextEditingController? _categoryNameController;
  bool categoryIsVisible = true;

  void initForm({
    required Category? category,
    required TextEditingController categoryNameController,
  }) {
    _logger.i(
      'argument: {category: $category, categoryNameController: $categoryNameController}',
    );

    _category = category;

    _categoryNameController = categoryNameController;
    categoryNameController.text = category?.name ?? '';

    setCategoryNature(
      category != null ? EnumToString.convertToString(category.nature) : 'none',
    );

    setColor(category?.color ?? '0xFF00B0FF');

    categoryIsVisible = category?.isVisible ?? true;
  }

  void setCategoryVisibility(bool isVisible) {
    _logger.i('argument: $isVisible');
    categoryIsVisible = isVisible;
    notifyListeners();
  }

  void handleSaveCategory() async {
    _logger.i('argument: NONE');

    if (_categoryNameController!.text.trim().isEmpty) {
      _logger.w("Category name cannot be empty");
      setCategoryNameValidationMessage("Please fill-in category name");
      handleShowSnackbar(message: categoryNameValidationMessage!);
      notifyListeners();
      return;
    }

    final newCategory = Category(
      name: _categoryNameController!.text,
      nature: EnumToString.fromString(
        CategoryNature.values,
        categoryNatureValue!,
      ),
      color: colorValue,
      isVisible: categoryIsVisible,
    );

    if (_category != null) {
      newCategory.id = _category!.id;
      newCategory.isDefault = _category!.isDefault;

      final updatedCategory = await _categoryService.updateCategory(newCategory);
      _logger.i('Category Updated Successfully: $updatedCategory');
    } else {
      final addedCategory = await _categoryService.createCategory(newCategory);
      _logger.i('Category Saved Successfully: $addedCategory');
    }

    popCurrentView();
  }

  void handleDeleteCategory() async {
    _logger.i('argument: NONE');

    final response = await _dialogService.showCustomDialog(
      variant: DialogType.deleteConfirmation,
      data:
          "Do you really want to delete category ${_category!.name}? All transactions under this category will be categorized as Undefined.",
    );

    if (response == null || !response.confirmed) {
      _logger.w("Delete Category Cancelled");
      return;
    }

    final deletedId = await _categoryService.deleteCategory(_category!.id);

    if (deletedId == -1) {
      _logger.e("Category Deletion Failed!");
      handleShowSnackbar(message: "Can't delete category. Please try again.");
      return;
    }

    popCurrentView();
  }

  void popCurrentView() {
    _logger.i('argument: NONE | Navigation Pop: 1');
    _navigationService.popRepeated(1);
  }

  void handleShowSnackbar({required String message}) {
    _logger.i('argument: {message: $message}');
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.main,
      message: message,
      duration: const Duration(seconds: 2),
      onTap: () {},
    );
  }

  @override
  void setFormStatus() {}
}
