import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
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
        title: 'Flutter Demo',
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
  final _themeService = locator<ThemeService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];

  ThemeMode getThemeMode() =>
      _themeService.isLightTheme ? ThemeMode.light : ThemeMode.dark;
}
