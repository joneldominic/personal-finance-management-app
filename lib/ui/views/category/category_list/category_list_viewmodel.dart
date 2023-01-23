import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/extensions/list_extension.dart';
import 'package:personal_finance_management_app/services/category_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class CategoryListViewModel extends StreamViewModel<List<Category>> {
  final _logger = getLogger('CategoryListViewModel');
  final _navigationService = locator<NavigationService>();
  final _categoryService = locator<CategoryService>();

  List<Category> categories = [];

  @override
  Stream<List<Category>> get stream => _categoryService.categoryCollectionStream();

  @override
  void onData(List<Category>? data) {
    _logger.i('argument: ${data?.itemsToString()}');
    categories = data ?? [];
    notifyListeners();
  }

  void navigateToCategoryDetail(Category? category) {
    _logger.i('argument: {category: $category}');
    _navigationService.navigateToCategoryDetailView(
      category: category,
    );
  }
}
