import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_garden/src/core/main_router.gr.dart';
import 'package:flutter_garden/src/infrastructure/theme.dart';
import 'package:flutter_garden/src/injection.dart';

const _title = "Garden";

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialize();
  await _runAppWithZoneGuarded();
}

Future<void> _initialize() async {
  await configureInjection();
  await _configureOrientationAndStyle();
}

Future<void> _configureOrientationAndStyle() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(appStyle());
}

Future<void> _runAppWithZoneGuarded() async {
  await runZonedGuarded(() async {
    runApp(GardenApp());
  }, (Object error, StackTrace stackTrace) {
    debugPrintStack(stackTrace: stackTrace, label: error.toString());
  });
}

class GardenApp extends StatelessWidget {
  GardenApp({Key? key}) : super(key: key);
  final _appRouter = MainRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: _title,
      theme: appTheme(context),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
