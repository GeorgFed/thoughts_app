import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thoughts_app/features/app/app.dart';

import 'common/logger.dart';

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
