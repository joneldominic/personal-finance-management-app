import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/category_nature.dart';
import 'package:personal_finance_management_app/data/dao/category_dao_impl.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/data/repositories/Category_repository.dart';
import 'package:stacked/stacked.dart';

class CategoryService with ReactiveServiceMixin {
  final _logger = getLogger('CategoryService');
  final _categoryRepository =
      CategoryRepository(categoryDao: CategoryDaoImpl());

  Future<List<Category>> initCategories() {
    _logger.i('argument: NONE');

    final categories = [
      Category(
        name: "Transfer",
        nature: CategoryNature.none,
        color: '0xFFFFFF00',
        isVisible: true,
        isDefault: true,
      ),
      Category(
        name: "Undefined",
        nature: CategoryNature.none,
        color: '0xFF757575',
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

  Future<Category> updateCategory(Category category) {
    _logger.i('argument: $category');
    return _categoryRepository.updateCategory(category);
  }

  Stream<List<Category>> categoryCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* _categoryRepository.categoryCollectionStream();
  }
}
