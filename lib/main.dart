import 'package:flutter_garden/main_common.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  await mainCommon(Environment.prod);
}
