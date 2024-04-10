import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/dashboard/ui/dashboard_page.dart';
import '../features/player/ui/player_page.dart';
import '../features/playlist/ui/playlist_page.dart';

class AppRouter {
  AppRouter();

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (
          BuildContext context,
          GoRouterState state,
        ) =>
            const DashboardPage(),
        routes: [
          GoRoute(
            path: 'playlist',
            builder: (
              BuildContext context,
              GoRouterState state,
            ) =>
                const PlaylistPage(),
          ),
          GoRoute(
            path: 'player',
            builder: (
              BuildContext context,
              GoRouterState state,
            ) =>
                const PlayerPage(),
          ),
        ],
      ),
    ],
  );

  RouterConfig<Object> get routerConfig => _router;
}
