// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:personal_finance_management_app/core/enums/time_period.dart';
import 'package:personal_finance_management_app/core/types/generic_pop_up_menu_item.dart';

/// Transactions Related Constants
const TRANSFER_CATEGORY_NAME = "Transfer";
const UNDEFINED_CATEGORY_NAME = "Undefined";
const FROM_ACCOUNT_CHANGE_NOTE = "From Account Change";

/// Accounts Related Constants
const DEFAULT_ACCOUNT_NAME = "Cash";
const DEFAULT_ACCOUNT_COLOR = '0xFF76FF03';
const DEFAULT_ACCOUNT_CURRENCY = "₱";

/// Settings Related Constants
const SETTINGS_ID = 1;

/// CashFlow Related Constants
const CASH_FLOW_ID = 1;

/// Icons Related Constants
const UNDEFINED_ICON = IconData(
  61529,
  fontFamily: "FontAwesomeRegular",
  fontPackage: "font_awesome_flutter",
  matchTextDirection: false,
);
const TRANSFER_ICON = IconData(
  61676,
  fontFamily: "FontAwesomeSolid",
  fontPackage: "font_awesome_flutter",
  matchTextDirection: false,
);

/// Asset Constants
const GOOGLE_LOGO_ASSET_IMAGE = AssetImage("assets/images/google.png");
const APP_LOGO_ASSET_IMAGE = AssetImage("assets/images/logo.png");

/// Popup Menu Constants
final TIME_PERIOD_MENU_ITEMS_SHORT = [
  GenericPopupMenuItem(value: TimePeriod.today, displayText: TimePeriod.today.str),
  GenericPopupMenuItem(value: TimePeriod.sevenDays, displayText: TimePeriod.sevenDays.str),
  GenericPopupMenuItem(value: TimePeriod.thirtyDays, displayText: TimePeriod.thirtyDays.str),
];

final TIME_PERIOD_MENU_ITEMS_LONG = [
  ...TIME_PERIOD_MENU_ITEMS_SHORT,
  GenericPopupMenuItem(value: TimePeriod.sixMonths, displayText: TimePeriod.sixMonths.str),
  GenericPopupMenuItem(value: TimePeriod.oneYear, displayText: TimePeriod.oneYear.str),
  GenericPopupMenuItem(value: TimePeriod.fiveYears, displayText: TimePeriod.fiveYears.str),
];
