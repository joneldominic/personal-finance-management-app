import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/services/theme_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PersonalFinanceManagementApp extends StatelessWidget {
  const PersonalFinanceManagementApp({Key? key}) : super(key: key);

/*   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  } */

  @override
  Widget build(BuildContext context) {
    // Using the reactive constructor gives you the traditional ViewModel
    // binding which will execute the builder again when notifyListeners is called.
    return ViewModelBuilder<PersonalFinanceManagementAppViewModel>.reactive(
      viewModelBuilder: () => PersonalFinanceManagementAppViewModel(),
      builder: (context, viewModel, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        themeMode: viewModel.getThemeMode(),
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
