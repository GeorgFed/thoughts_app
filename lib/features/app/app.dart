import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/app_di.dart';

class ThoughtsApp extends StatelessWidget {
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  const ThoughtsApp({
    required this.lightTheme,
    required this.darkTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: Consumer(
          builder: (context, ref, _) => MaterialApp.router(
            title: 'Flutter Demo',
            darkTheme: darkTheme,
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: ref.watch(AppDi.routerConfig).routerConfig,
          ),
        ),
      );
}
