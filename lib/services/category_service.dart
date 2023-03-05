import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/category_nature.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/dao/category_dao_impl.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/data/repositories/category_repository.dart';
import 'package:stacked/stacked.dart';

class CategoryService with ReactiveServiceMixin {
  final _logger = getLogger('CategoryService');
  final _categoryRepository = CategoryRepository(categoryDao: CategoryDaoImpl());

  Future<List<Category>> initCategories() {
    _logger.i('argument: NONE');

    final categories = [
      Category(
        name: TRANSFER_CATEGORY_NAME,
        nature: CategoryNature.none,
        color: TRANSFER_CATEGORY_COLOR,
        categoryIconData: CategoryIconData.fromIconData(TRANSFER_ICON),
        isVisible: true,
        isDefault: true,
      ),
      Category(
        name: UNDEFINED_CATEGORY_NAME,
        nature: CategoryNature.none,
        color: UNDEFINED_CATEGORY_COLOR,
        categoryIconData: CategoryIconData.fromIconData(UNDEFINED_ICON),
        isVisible: true,
        isDefault: true,
      )
    ];

    return _categoryRepository.createCategories(categories);
  }

  Future<Category> createCategory(Category category) async {
    _logger.i('argument: $category');
    return _categoryRepository.createCategory(category);
  }

  Future<List<Category>> createCategories(List<Category> categories) {
    _logger.i('argument: $categories');
    return _categoryRepository.createCategories(categories);
  }

  Future<Id> deleteCategory(Id id) {
    _logger.i('argument: $id');
    return _categoryRepository.deleteCategory(id);
  }

  Future<List<Category>> getCategories() {
    _logger.i('argument: NONE');
    return _categoryRepository.getCategories();
  }

  Future<Category> getCategoryById(Id id) {
    _logger.i('argument: $id');
    return _categoryRepository.getCategoryById(id);
  }

  Future<Category> getCategoryByName(String name) {
    _logger.i('argument: $name');
    return _categoryRepository.getCategoryByName(name);
  }

  Future<Category> updateCategory(Category category) {
    _logger.i('argument: $category');
    return _categoryRepository.updateCategory(category);
  }

  Stream<List<Category>> categoryCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* _categoryRepository.categoryCollectionStream();
  }
}
