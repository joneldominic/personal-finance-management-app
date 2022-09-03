import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/core/utils/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String title = '';

  void doSomething() {
    final logger = getSimpleLogger("StartUpViewModel");
    logger.v("Verbose log", "test");
    logger.d("Debug log");
    logger.i("Info log");
    logger.w("Warning log");
    logger.e("Error log");
    logger.wtf("What a terrible failure log");

    _navigationService.navigateTo(Routes.homeView);
  }
}
