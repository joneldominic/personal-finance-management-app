import 'package:package_info_plus/package_info_plus.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class AboutViewModel extends BaseViewModel {
  final _logger = getLogger('AboutViewModel');
  final _snackbarService = locator<SnackbarService>();

  PackageInfo? packageInfo;

  void init() async {
    _logger.i('argument: NONE');

    packageInfo = await PackageInfo.fromPlatform();
    _logger.d(packageInfo);

    notifyListeners();
  }

  void onTapLink(Uri uri) {
    _logger.i('argument: $uri');
    _openLink(uri);
  }

  void onOpenGithubRepo() {
    _logger.i('argument: NONE');

    // TODO: Get value from ENV
    const githubURL = 'https://github.com/joneldominic/personal-finance-management-app';
    _openLink(Uri.parse(githubURL));
  }

  void onRateApp() {
    _logger.i('argument: NONE');

    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.main,
      message: "Feature coming soon! Stay tuned for updates.",
      duration: const Duration(seconds: 2),
      onTap: () {},
    );
  }

  void _openLink(Uri uri) async {
    try {
      await launchUrl(uri);
      _logger.i('Link Opened: $uri');
    } on Exception catch (_, e) {
      _logger.e("Failed to open link with error: $e");
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.main,
        message: "Failed to open link. Please try again.",
        duration: const Duration(seconds: 2),
        onTap: () {},
      );
    }
  }
}
