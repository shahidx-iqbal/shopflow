import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/di/injection_container.dart';
import 'core/local_storage/hive_service.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/presentation/cubit/locale_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(AppTheme.defaultSystemOverlayStyle);

  await configureDependencies();
  await getIt<HiveService>().init();

  runApp(
    BlocProvider(
      create: (_) => getIt<LocaleCubit>()..load(),
      child: const ShopFlowApp(),
    ),
  );
}
