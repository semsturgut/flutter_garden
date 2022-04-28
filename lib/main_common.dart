import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_garden/src/infrastructure/theme.dart';
import 'package:flutter_garden/src/injection.dart';
import 'package:flutter_garden/src/presentation/garden_list_page/garden_list_page.dart';

const _title = "Garden";

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialize(env);
  await _runAppWithZoneGuarded();
}

Future<void> _initialize(String env) async {
  await configureInjection(env);
  await _configureOrientationAndStyle();
}

Future<void> _configureOrientationAndStyle() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(appStyle());
}

Future<void> _runAppWithZoneGuarded() async {
  await runZonedGuarded(() async {
    runApp(const GardenApp());
  }, (Object error, StackTrace stackTrace) {
    debugPrintStack(stackTrace: stackTrace, label: error.toString());
  });
}

class GardenApp extends StatelessWidget {
  const GardenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: appTheme(context),
      home: const GardenListPage(),
    );
  }
}
