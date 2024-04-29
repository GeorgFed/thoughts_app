import 'dart:async';

import 'package:flutter/material.dart';

import 'common/logger.dart';
import 'common/theme.dart';
import 'features/app/app.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        logger.i('Starting app in main.dart');
        const themeProvider = AppThemeProvider();

        final lightTheme = await themeProvider.getTheme(isDarkMode: false);
        final darkTheme = await themeProvider.getTheme(isDarkMode: true);

        if (lightTheme == null || darkTheme == null) {
          logger.e('Failed to decode theme');
          return;
        } else {
          logger.i('Theme loaded');
        }

        runApp(
          ThoughtsApp(
            lightTheme: lightTheme,
            darkTheme: darkTheme,
          ),
        );
      },
      (error, stackTrace) => logger.e('MAIN: Catch in mainZone $error'),
    );
