import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/core/enums/snackbar_type.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.main,
    config: SnackbarConfig(
      borderRadius: 5,
      margin: const EdgeInsets.all(10),
    ),
  );
}
