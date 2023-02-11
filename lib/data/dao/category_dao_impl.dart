import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/dao/category_dao.dart';
import 'package:personal_finance_management_app/data/database/isar_database.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';

class CategoryDaoImpl extends CategoryDao {
  static final CategoryDaoImpl _categoryDaoImpl = CategoryDaoImpl._internal();

  factory CategoryDaoImpl() {
    return _categoryDaoImpl;
  }

  CategoryDaoImpl._internal();

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
  Future<List<Category>> createCategories(List<Category> categories) async {
    _logger.i('argument: $categories');

    Isar isar = await _db;

    final categoryCollection = isar.categorys;

    final createdCategories = await isar.writeTxn(() async {
      final ids = await categoryCollection.putAll(categories);
      return await categoryCollection.getAll(ids);
    });

    return createdCategories.cast<Category>();
  }

  @override
  Future<Id> deleteCategory(Id id) async {
    _logger.i('argument: $id');

    Isar isar = await _db;

    final categoryCollection = isar.categorys;
    final transactionCollection = isar.transactions;

    final isDeleted = await isar.writeTxn(() async {
      final category = await categoryCollection.get(id);
      final undefinedCategory =
          await categoryCollection.filter().nameEqualTo(UNDEFINED_CATEGORY_NAME).findFirst();

      await category!.transactions.load();
      final transactions = category.transactions.toList();

      await Future.forEach(transactions, (Transaction t) async {
        t.category.value = undefinedCategory;
        await t.category.save();
      });
      await transactionCollection.putAll(transactions);

      return await categoryCollection.delete(id);
    });

    return isDeleted ? id : -1;
  }

  @override
  Future<List<Category>> getCategories() async {
    _logger.i('argument: NONE');

    Isar isar = await _db;

    final categoryCollection = isar.categorys;
    final categories = await isar.writeTxn(() async {
      return await categoryCollection.where().findAll();
    });

    return categories;
  }

  @override
  Future<Category> getCategoryById(Id id) async {
    Isar isar = await _db;

    final categoryCollection = isar.categorys;
    final category = await isar.writeTxn(() async {
      return await categoryCollection.get(id);
    });

    return category!;
  }

  @override
  Future<Category> getCategoryByName(String name) async {
    _logger.i('argument: $name');

    Isar isar = await _db;

    final categoryCollection = isar.categorys;
    final category = await isar.writeTxn(() async {
      return await categoryCollection.filter().nameEqualTo(name).findFirst();
    });

    return category!;
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
