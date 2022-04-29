import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: appStyle(),
    ),
  );
}

SystemUiOverlayStyle appStyle() => const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    );
