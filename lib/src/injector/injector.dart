import 'package:gdg_dependency_injection/src/models/tiny_age.dart';
import 'package:gdg_dependency_injection/src/models/tiny_user.dart';
import 'package:gdg_dependency_injection/src/services/api.dart';
import 'package:gdg_dependency_injection/src/viewModels/home_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register TinyAge as Singleton
  // This is for an unique instance
  locator.registerSingleton(TinyAge());

  // Register TinyUser as Factory
  // This is for a different instance of each type.
  locator.registerFactory(() => TinyUser());

  locator.registerLazySingleton(() => ApiService());
  locator.registerFactory(() => HomeViewModel());
}
