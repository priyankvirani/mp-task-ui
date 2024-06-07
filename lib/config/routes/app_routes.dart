import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_routes.gr.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
late BuildContext buildContext;

class Routes {
  static const String HOME = "/";
  static const String HOME_SCREEN = "/HOME_SCREEN";
}

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: Routes.HOME, page: HomeRoute.page, initial: true),
        // AutoRoute(
        //   path: Routes.HOME_SCREEN,
        //   page: HomeRoute.page,
        // ),
      ];
}
