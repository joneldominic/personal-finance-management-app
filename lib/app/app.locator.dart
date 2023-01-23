// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

// ignore: depend_on_referenced_packages
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/account_service.dart';
import '../services/category_service.dart';
import '../services/theme_service.dart';
import '../services/transaction_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => AccountService());
  locator.registerLazySingleton(() => TransactionService());
  locator.registerLazySingleton(() => CategoryService());
}
