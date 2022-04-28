import 'package:flutter_garden/src/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(generateForDir: ['lib', 'bin', 'test'])
Future<void> configureInjection(String environment) async {
  $initGetIt(getIt, environment: environment);
}

@module
abstract class RegisterModule {}
