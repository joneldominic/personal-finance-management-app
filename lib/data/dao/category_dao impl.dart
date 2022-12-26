import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/category_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';

class CategoryDaoImpl extends CategoryDao {
  final _logger = getLogger('CategoryDaoImpl');

  Future<Isar> get _db async => await IsarDatabase.instance.database;

  @override
  Future<Category> createCategory(Category category) async {
    _logger.i('argument: $category');

    Isar isar = await _db;

    final categoryCollection = isar.categorys;
    final createdCategory = await isar.writeTxn(() async {
      final id = await categoryCollection.put(category);
      return await categoryCollection.get(id);
    });

    return createdCategory!;
  }

  @override
  Future<Id> deleteCategory(Id id) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Category> getCategoryById(Id id) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }

  @override
  Future<Category> updateCategory(Category category) async {
    _logger.i('argument: $category');

    Isar isar = await _db;

    final categoryCollection = isar.categorys;
    final updatedCategory = await isar.writeTxn(() async {
      await categoryCollection.put(category);
      return category;
    });

    return updatedCategory;
  }

  @override
  Stream<List<Category>> categoryCollectionStream() async* {
    _logger.i('argument: NONE');

    Isar isar = await _db;

    final categoryCollection = isar.categorys;
    Query<Category> categoriesQuery = categoryCollection.where().build();

    yield* categoriesQuery.watch(fireImmediately: true);
  }
}