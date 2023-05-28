import 'package:package_info_plus/package_info_plus.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:stacked/stacked.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class AboutViewModel extends BaseViewModel {
  final _logger = getLogger('AboutViewModel');

  PackageInfo? packageInfo;

  void init() async {
    _logger.i('argument: NONE');

    packageInfo = await PackageInfo.fromPlatform();
    _logger.d(packageInfo);

    notifyListeners();
  }
}
