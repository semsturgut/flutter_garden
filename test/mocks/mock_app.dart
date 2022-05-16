import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_garden/src/core/main_router.gr.dart';
import 'package:flutter_garden/src/infrastructure/theme.dart';

class MockApp extends StatelessWidget {
  final PageRouteInfo initialRoute;

  MockApp(this.initialRoute, {Key? key}) : super(key: key);

  final _appRouter = MainRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme(context),
      routerDelegate: _appRouter.delegate(initialRoutes: [initialRoute]),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
