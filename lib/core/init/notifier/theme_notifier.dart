import 'package:flutter/material.dart';
import 'package:cuzdan/core/constant/enum/app_theme_enum.dart';
import 'package:cuzdan/core/init/theme/app_theme.dart';
import 'package:cuzdan/core/init/theme/app_theme_datas.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeAppTheme(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeDatas().lightTheme;
    } else {
      _currentTheme = AppThemeDatas().darkTheme;
    }
    notifyListeners();
  }
}
