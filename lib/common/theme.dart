import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

class AppThemeProvider {
  const AppThemeProvider();

  static const _lightThemePath = 'assets/theme/theme_light.json';
  static const _darkThemePath = 'assets/theme/theme_dark.json';

  Future<ThemeData?> getTheme({
    required bool isDarkMode,
  }) async {
    final lightThemeRaw = await rootBundle.loadString(_lightThemePath);
    final darkThemeRaw = await rootBundle.loadString(_darkThemePath);
    final themeJson =
        isDarkMode ? jsonDecode(darkThemeRaw) : jsonDecode(lightThemeRaw);
    final theme = ThemeDecoder.decodeThemeData(themeJson);
    return theme;
  }
}
