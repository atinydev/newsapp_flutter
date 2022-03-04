import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const homeRoute = TabsScreen.routeName;

  static const screensOptions = <_ScreenRoute>[
    _ScreenRoute(
      route: TabsScreen.routeName,
      screen: TabsScreen(),
    ),
    _ScreenRoute(
      route: Tab1Screen.routeName,
      screen: Tab1Screen(),
    ),
    _ScreenRoute(
      route: Tab2Screen.routeName,
      screen: Tab2Screen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> get getAppRoutes {
    final appRoutes = <String, Widget Function(BuildContext)>{};
    for (final option in screensOptions) {
      appRoutes.addAll({
        option.route: (BuildContext context) => option.screen,
      });
    }
    return appRoutes;
  }
}

class _ScreenRoute {
  final String route;
  final Widget screen;

  const _ScreenRoute({
    required this.route,
    required this.screen,
  });
}
