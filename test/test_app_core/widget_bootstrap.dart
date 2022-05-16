import 'package:flutter/material.dart';

class WidgetBootstrap extends StatelessWidget {
  final Widget body;
  const WidgetBootstrap({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(child: Scaffold(body: body)),
    );
  }
}
