import 'package:flutter/material.dart';

class ThoughtsApp extends StatelessWidget {
  final ThemeData theme;
  final RouterConfig<Object> routerConfig;

  const ThoughtsApp({
    required this.theme,
    required this.routerConfig,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Flutter Demo',
        theme: theme,
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
      );
}
