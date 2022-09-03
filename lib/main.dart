import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:personal_finance_management_app/app/app.locator.dart';

import 'app.dart';

void main() {
  Logger.level = Level.verbose;
  setupLocator();
  runApp(const PersonalFinanceManagementApp());
}
