import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/category_dao.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';

class CategoryRepository {
  final _logger = getLogger('CategoryRepository');
  final CategoryDao categoryDao;

  CategoryRepository({required this.categoryDao});

  Future<Category> createCategory(Category category) async {
    _logger.i('argument: $category');
    return categoryDao.createCategory(category);
  }

  Future<Id> deleteCategory(Id id) {
    _logger.i('argument: $id');
    return categoryDao.deleteCategory(id);
  }

  Future<List<Category>> getCategories() {
    _logger.i('argument: NONE');
    return categoryDao.getCategories();
  }

  Future<Category> getCategoryById(Id id) {
    _logger.i('argument: $id');
    return categoryDao.getCategoryById(id);
  }

  Future<Category> updateCategory(Category category) {
    _logger.i('argument: $category');
    return categoryDao.updateCategory(category);
  }

  Stream<List<Category>> categoryCollectionStream() async* {
    _logger.i('argument: NONE');
    yield* categoryDao.categoryCollectionStream();
  }
}
