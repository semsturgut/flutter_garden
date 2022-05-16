import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_app.dart';

class TestBootstrap extends StatelessWidget {
  final PageRouteInfo initialRoute;
  final Locale? locale;

  const TestBootstrap({
    required this.initialRoute,
    this.locale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MockApp(initialRoute);
  }
}

Widget bootStrapTest(PageRouteInfo initialRoute, {Locale? locale}) {
  return TestBootstrap(
    initialRoute: initialRoute,
    locale: locale,
  );
}

Future<void> setIphoneXPhoneSize(WidgetTester tester) async {
  //iPhone X size
  const _size = Size(1125, 2436);
  // const _size = Size(375, 812);
  await tester.binding.setSurfaceSize(_size);
  tester.binding.window.physicalSizeTestValue = _size;
  tester.binding.window.devicePixelRatioTestValue = 1;
  tester.binding.window.textScaleFactorTestValue = 0.8;
}
