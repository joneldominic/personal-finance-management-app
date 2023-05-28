import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class ProfileViewModel extends BaseViewModel {
  final _logger = getLogger('ProfileViewModel');
  final _snackbarService = locator<SnackbarService>();

  void handleSignInGoogle() {
    _logger.i('argument: NONE');

    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.main,
      message: "Feature coming soon! Stay tuned for updates.",
      duration: const Duration(seconds: 2),
      onTap: () {},
    );
  }
}
