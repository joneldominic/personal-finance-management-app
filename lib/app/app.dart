import 'package:personal_finance_management_app/services/theme_service.dart';
import 'package:personal_finance_management_app/ui/views/account/account_detail/account_detail_view.dart';
import 'package:personal_finance_management_app/ui/views/account/account_settings/account_settings_view.dart';
import 'package:personal_finance_management_app/ui/views/category/category_list/category_list_view.dart';
import 'package:personal_finance_management_app/ui/views/main/main_view.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  CupertinoRoute(page: MainView, initial: true),
  CupertinoRoute(page: AccountSettingsView),
  MaterialRoute(page: AccountDetailView),
  MaterialRoute(page: TransactionDetailView),
  CupertinoRoute(page: CategoryListView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: ThemeService)
], logger: StackedLogger())
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
