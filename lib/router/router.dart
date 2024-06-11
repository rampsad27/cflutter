import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juneeight/ui/screens/homeScreen.dart';
import 'package:juneeight/ui/screens/newsScreen.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GoRouter router =
      GoRouter(navigatorKey: navigatorKey, routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const NewsScreen();
        })
  ]);
}
