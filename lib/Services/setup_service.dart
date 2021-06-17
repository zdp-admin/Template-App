import 'package:template/Services/auth_service.dart';
import 'package:template/Services/navigation_service.dart';
import 'package:template/Services/rest_service.dart';
import 'package:template/utils/app_settings.dart';
import 'package:get_it/get_it.dart';

GetIt appService = GetIt.instance;

void setupService() {
  appService.registerLazySingleton(() => AppSettings());
  appService.registerLazySingleton(() => NavigationService());
  appService.registerLazySingleton(() => AuthService());
  appService.registerLazySingleton(() => RestService());
}
