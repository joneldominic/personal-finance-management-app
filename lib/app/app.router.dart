// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../data/models/account/account.dart';
import '../data/models/category/category.dart';
import '../ui/views/account/account_detail/account_detail_view.dart';
import '../ui/views/account/account_settings/account_settings_view.dart';
import '../ui/views/category/category_detail/category_detail_view.dart';
import '../ui/views/category/category_list/category_list_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/transaction/transaction_detail/transaction_detail_view.dart';

class Routes {
  static const String mainView = '/';
  static const String accountSettingsView = '/account-settings-view';
  static const String accountDetailView = '/account-detail-view';
  static const String transactionDetailView = '/transaction-detail-view';
  static const String categoryListView = '/category-list-view';
  static const String categoryDetailView = '/category-detail-view';
  static const all = <String>{
    mainView,
    accountSettingsView,
    accountDetailView,
    transactionDetailView,
    categoryListView,
    categoryDetailView,
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
    RouteDef(Routes.categoryDetailView, page: CategoryDetailView),
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
          account: args.account,
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
    CategoryDetailView: (data) {
      var args = data.getArgs<CategoryDetailViewArguments>(
        orElse: () => CategoryDetailViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoryDetailView(
          key: args.key,
          category: args.category,
        ),
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
  final Account? account;
  AccountDetailViewArguments({this.key, this.account});
}

/// TransactionDetailView arguments holder class
class TransactionDetailViewArguments {
  final Key? key;
  final bool isAddTransaction;
  TransactionDetailViewArguments({this.key, this.isAddTransaction = true});
}

/// CategoryDetailView arguments holder class
class CategoryDetailViewArguments {
  final Key? key;
  final Category? category;
  CategoryDetailViewArguments({this.key, this.category});
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
    Account? account,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.accountDetailView,
      arguments: AccountDetailViewArguments(key: key, account: account),
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

  Future<dynamic> navigateToCategoryDetailView({
    Key? key,
    Category? category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.categoryDetailView,
      arguments: CategoryDetailViewArguments(key: key, category: category),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
