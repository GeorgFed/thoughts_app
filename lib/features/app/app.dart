import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThoughtsApp extends StatelessWidget {
  final ThemeData darkTheme;
  final ThemeData lightTheme;
  final RouterConfig<Object> routerConfig;

  const ThoughtsApp({
    required this.lightTheme,
    required this.darkTheme,
    required this.routerConfig,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: MaterialApp.router(
          title: 'Flutter Demo',
          darkTheme: darkTheme,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: routerConfig,
        ),
      );
}
