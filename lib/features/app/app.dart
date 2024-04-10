import 'package:flutter/material.dart';

import '../dashboard/ui/dashboard_page.dart';

class ThoughtsApp extends StatelessWidget {
  const ThoughtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}
