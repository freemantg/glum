// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../main.dart' as _i1;
import '../cards/cards_page.dart' as _i2;
import '../stats/stats_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CardsPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CardsPage(),
      );
    },
    StatsPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.StatsPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomePageRoute.name,
          path: '/',
          children: [
            _i4.RouteConfig(
              CardsPageRoute.name,
              path: 'cards-page',
              parent: HomePageRoute.name,
            ),
            _i4.RouteConfig(
              StatsPageRoute.name,
              path: 'stats-page',
              parent: HomePageRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i4.PageRouteInfo<void> {
  const HomePageRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.CardsPage]
class CardsPageRoute extends _i4.PageRouteInfo<void> {
  const CardsPageRoute()
      : super(
          CardsPageRoute.name,
          path: 'cards-page',
        );

  static const String name = 'CardsPageRoute';
}

/// generated route for
/// [_i3.StatsPage]
class StatsPageRoute extends _i4.PageRouteInfo<void> {
  const StatsPageRoute()
      : super(
          StatsPageRoute.name,
          path: 'stats-page',
        );

  static const String name = 'StatsPageRoute';
}
