import 'package:personal_finance_management_app/services/theme_service.dart';
import 'package:personal_finance_management_app/ui/views/account/account_details/account_details_view.dart';
import 'package:personal_finance_management_app/ui/views/account/account_settings/account_settings_view.dart';
import 'package:personal_finance_management_app/ui/views/details/details_view.dart';
import 'package:personal_finance_management_app/ui/views/main/main_view.dart';
import 'package:personal_finance_management_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  CupertinoRoute(page: MainView),
  CupertinoRoute(page: AccountSettingsView),
  CupertinoRoute(page: AccountDetailsView),
  CupertinoRoute(page: DetailsView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: ThemeService)
], logger: StackedLogger())
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
