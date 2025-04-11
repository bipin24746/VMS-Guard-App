import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(); // Register Dio as a singleton
}
