// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/details/details_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String homeView = '/home-view';
  static const String detailsView = '/details-view';
  static const all = <String>{
    startUpView,
    homeView,
    detailsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.detailsView, page: DetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    DetailsView: (data) {
      var args = data.getArgs<DetailsViewArguments>(
        orElse: () => DetailsViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => DetailsView(
          key: args.key,
          name: args.name,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DetailsView arguments holder class
class DetailsViewArguments {
  final Key? key;
  final String name;
  DetailsViewArguments({this.key, this.name = ''});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToStartUpView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startUpView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToDetailsView({
    Key? key,
    String name = '',
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.detailsView,
      arguments: DetailsViewArguments(key: key, name: name),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
