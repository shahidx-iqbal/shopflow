import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection_container.config.dart';

/// Global service locator instance.
final GetIt getIt = GetIt.instance;

/// Initializes dependency injection via injectable code generation.
///
/// [SharedPreferences] and [Connectivity] are registered manually first
/// because they require external/async setup before [getIt.init] runs.
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  getIt.init();
}
