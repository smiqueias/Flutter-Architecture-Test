import 'package:flutter_architecture_test/src/core/theme/app_colors.dart';
import 'package:flutter_architecture_test/src/core/theme/app_icons.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  //Theme
  getIt.registerSingleton<AppColors>(AppColors());
  getIt.registerSingleton<AppIcons>(AppIcons());
  getIt.registerSingleton<AppTheme>(AppTheme(colors: getIt<AppColors>(), icons: getIt<AppIcons>()));
}
