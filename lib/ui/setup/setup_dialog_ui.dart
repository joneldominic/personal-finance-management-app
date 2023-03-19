import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/core/enums/dialog_type.dart';
import 'package:personal_finance_management_app/ui/dialogs/balance_confirmation_dialog.dart';
import 'package:personal_finance_management_app/ui/dialogs/delete_confirmation_dialog.dart';
import 'package:personal_finance_management_app/ui/dialogs/update_balance_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<dynamic, DialogBuilder> builders = {
    DialogType.balanceUpdateConfirmation: (context, sheetRequest, completer) =>
        BalanceConfirmationDialog(request: sheetRequest, completer: completer),
    DialogType.deleteConfirmation: (context, sheetRequest, completer) =>
        DeleteConfirmationDialog(request: sheetRequest, completer: completer),
    DialogType.updateBalanceDialog: (context, sheetRequest, completer) =>
        UpdateBalanceDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
