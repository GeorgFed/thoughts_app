import 'dart:async';

import 'package:flutter/material.dart';

import 'common/logger.dart';
import 'features/app/app.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      logger.i('Starting app in main.dart');
      runApp(const ThoughtsApp());
    },
    (error, stackTrace) => logger.e('MAIN: Catch in mainZone $error'),
  );
}
