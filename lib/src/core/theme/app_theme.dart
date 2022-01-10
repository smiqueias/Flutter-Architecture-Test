import 'package:flutter_architecture_test/src/core/theme/app_colors.dart';
import 'package:flutter_architecture_test/src/core/theme/app_icons.dart';
import 'package:flutter_architecture_test/src/core/theme/app_text_styles.dart';

class AppTheme {

  AppTheme._();

  static final AppTheme _instance = AppTheme._();

  factory AppTheme() {
    return _instance;
  }

  final _colors = AppColors();
  static AppColors get colors => AppTheme()._colors;

  final _icons = AppIcons();
  static AppIcons get icons => AppTheme()._icons;

  final _textStyles = AppTextStyle();
  static AppTextStyle get textStyles => AppTheme()._textStyles;

}
