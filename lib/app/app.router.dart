// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/account/account_details/account_detail_view.dart';
import '../ui/views/account/account_settings/account_settings_view.dart';
import '../ui/views/category/category_list/category_list_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/transaction/transaction_detail/transaction_detail_view.dart';

class Routes {
  static const String mainView = '/';
  static const String accountSettingsView = '/account-settings-view';
  static const String accountDetailView = '/account-detail-view';
  static const String transactionDetailView = '/transaction-detail-view';
  static const String categoryListView = '/category-list-view';
  static const all = <String>{
    mainView,
    accountSettingsView,
    accountDetailView,
    transactionDetailView,
    categoryListView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.accountSettingsView, page: AccountSettingsView),
    RouteDef(Routes.accountDetailView, page: AccountDetailView),
    RouteDef(Routes.transactionDetailView, page: TransactionDetailView),
    RouteDef(Routes.categoryListView, page: CategoryListView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    AccountSettingsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AccountSettingsView(),
        settings: data,
      );
    },
    AccountDetailView: (data) {
      var args = data.getArgs<AccountDetailViewArguments>(
        orElse: () => AccountDetailViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AccountDetailView(
          key: args.key,
          isAddAccount: args.isAddAccount,
        ),
        settings: data,
      );
    },
    TransactionDetailView: (data) {
      var args = data.getArgs<TransactionDetailViewArguments>(
        orElse: () => TransactionDetailViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TransactionDetailView(
          key: args.key,
          isAddTransaction: args.isAddTransaction,
        ),
        settings: data,
      );
    },
    CategoryListView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CategoryListView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AccountDetailView arguments holder class
class AccountDetailViewArguments {
  final Key? key;
  final bool isAddAccount;
  AccountDetailViewArguments({this.key, this.isAddAccount = true});
}

/// TransactionDetailView arguments holder class
class TransactionDetailViewArguments {
  final Key? key;
  final bool isAddTransaction;
  TransactionDetailViewArguments({this.key, this.isAddTransaction = true});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToMainView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.mainView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAccountSettingsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.accountSettingsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAccountDetailView({
    Key? key,
    bool isAddAccount = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.accountDetailView,
      arguments:
          AccountDetailViewArguments(key: key, isAddAccount: isAddAccount),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToTransactionDetailView({
    Key? key,
    bool isAddTransaction = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.transactionDetailView,
      arguments: TransactionDetailViewArguments(
          key: key, isAddTransaction: isAddTransaction),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCategoryListView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.categoryListView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
