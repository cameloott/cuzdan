import 'package:flutter/material.dart';
import 'package:cuzdan/core/init/theme/app_theme_datas.dart';

class AppTheme {
  static AppTheme? _instance;
  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  AppTheme._init();

  ThemeData get theme => AppThemeDatas().lightTheme;
}
