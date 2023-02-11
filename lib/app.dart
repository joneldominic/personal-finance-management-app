import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:personal_finance_management_app/services/category_service.dart';
import 'package:personal_finance_management_app/services/theme_service.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PersonalFinanceManagementApp extends StatelessWidget {
  const PersonalFinanceManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalFinanceManagementAppViewModel>.reactive(
      viewModelBuilder: () => PersonalFinanceManagementAppViewModel(),
      builder: (context, model, child) => MaterialApp(
        title: 'Personal Finance Management App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: CustomTheme.light.scaffoldBackgroundColor,
          extensions: <ThemeExtension<dynamic>>[
            CustomTheme.light,
          ],
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: CustomTheme.dark.scaffoldBackgroundColor,
          extensions: <ThemeExtension<dynamic>>[
            CustomTheme.dark,
          ],
        ),
        themeMode: model.getThemeMode(),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}

class PersonalFinanceManagementAppViewModel extends ReactiveViewModel {
  final _logger = getLogger('PersonalFinanceManagementAppViewModel');
  final _themeService = locator<ThemeService>();
  final _categoryService = locator<CategoryService>();
  final _accountService = locator<AccountService>();

  PersonalFinanceManagementAppViewModel() {
    _logger.i('argument: NONE');
    initDatabaseRecords();
  }

  void initDatabaseRecords() async {
    _logger.i('argument: NONE');

    bool isFirstRun = await IsFirstRun.isFirstRun();
    if (isFirstRun) {
      _logger.i("Initializing Database Records");

      final defaultCategories = await _categoryService.initCategories();
      final defaultAccount = await _accountService.initAccount();

      if (defaultCategories.length == 2 && defaultAccount != null) return;
      await IsFirstRun.reset();
    }
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];

  ThemeMode getThemeMode() => _themeService.isLightTheme ? ThemeMode.light : ThemeMode.dark;
}
