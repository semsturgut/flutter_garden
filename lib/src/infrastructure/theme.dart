import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.standard,
    splashColor: Colors.transparent,
    colorScheme: const ColorScheme.light(),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: appStyle(),
    ),
  );
}

SystemUiOverlayStyle appStyle() => const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
