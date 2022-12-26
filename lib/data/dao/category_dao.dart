import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';

abstract class CategoryDao {
  Future<Category> createCategory(Category category);
  Future<Category> getCategoryById(Id id);
  Future<List<Category>> getCategories();
  Future<Category> updateCategory(Category category);
  Future<Id> deleteCategory(Id id);
  Stream<List<Category>> categoryCollectionStream();
}
