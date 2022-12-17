import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/ui/setup/setup_dialog_ui.dart';
import 'package:personal_finance_management_app/ui/setup/snackbar_setup_ui.dart';

import 'app.dart';

Future<void> main() async {
  Logger.level = Level.verbose;
  await setupLocator();
  setupDialogUi();
  setupSnackbarUi();
  runApp(const PersonalFinanceManagementApp());
}
