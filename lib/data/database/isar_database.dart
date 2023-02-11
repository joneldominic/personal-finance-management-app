import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/models/category/category.dart';
import 'package:personal_finance_management_app/data/models/settings/settings.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class IsarDatabase {
  final _logger = getLogger('CategoryRepository');
  static final IsarDatabase _singleton = IsarDatabase._();

  static IsarDatabase get instance => _singleton;

  Completer<Isar>? _dbOpenCompleter;

  IsarDatabase._();

  Future<Isar> get database async {
    if (_dbOpenCompleter == null) {
      _logger.i("Instantiating isar database");
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    _logger.i("Opening isar database");
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open(
      [
        AccountSchema,
        TransactionSchema,
        CategorySchema,
        SettingsSchema,
      ],
      directory: appDocumentDir.path,
      inspector: true,
      name: "pfmapp_db",
    );

    _dbOpenCompleter?.complete(isar);
  }
}
