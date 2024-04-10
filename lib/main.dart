import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import 'common/logger.dart';
import 'common/router.dart';
import 'features/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () async {
      logger.i('Starting app in main.dart');
      final theme = await _getTheme(isDarkMode: false);

      if (theme == null) {
        logger.e('Failed to decode theme');
        return;
      } else {
        logger.i('Theme loaded');
      }

      final router = AppRouter();

      runApp(
        ThoughtsApp(
          theme: theme,
          routerConfig: router.routerConfig,
        ),
      );
    },
    (error, stackTrace) => logger.e('MAIN: Catch in mainZone $error'),
  );
}

Future<ThemeData?> _getTheme({
  required bool isDarkMode,
}) async {
  final lightThemeRaw =
      await rootBundle.loadString('assets/theme/theme_light.json');
  final darkThemeRaw =
      await rootBundle.loadString('assets/theme/theme_dark.json');
  final themeJson =
      isDarkMode ? jsonDecode(darkThemeRaw) : jsonDecode(lightThemeRaw);
  final theme = ThemeDecoder.decodeThemeData(themeJson);
  return theme;
}
