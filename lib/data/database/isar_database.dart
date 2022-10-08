import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';

class IsarDatabase {
  static final IsarDatabase _singleton = IsarDatabase._();

  static IsarDatabase get instance => _singleton;

  Completer<Isar>? _dbOpenCompleter;

  IsarDatabase._();

  Future<Isar> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open(
      [AccountSchema],
      directory: appDocumentDir.path,
      inspector: true,
      name: "pfmapp_db",
    );

    _dbOpenCompleter?.complete(isar);
  }
}
