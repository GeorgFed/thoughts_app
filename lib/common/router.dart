import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/sign_in/ui/sign_in_page.dart';
import '../features/auth/sign_up/ui/enter_name_page.dart';
import '../features/auth/sign_up/ui/sign_up_page.dart';
import '../features/dashboard/ui/dashboard_page.dart';
import '../features/player/ui/player_page.dart';
import '../features/playlist/ui/playlist_page.dart';
import '../features/profile/ui/profile_page.dart';
import '../features/suggest/ui/suggest_page.dart';

class AppRouter {
  AppRouter();

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const DashboardPage(),
        routes: [
          GoRoute(
            path: 'playlist',
            builder: (_, __) => const PlaylistPage(),
          ),
          GoRoute(
            path: 'player',
            builder: (_, __) => const PlayerPage(),
          ),
          GoRoute(
            path: 'sign_in',
            builder: (_, __) => const SignInPage(),
          ),
          GoRoute(
            path: 'sign_up',
            builder: (_, __) => const SignUpPage(),
          ),
          GoRoute(
            path: 'enter_name',
            builder: (_, __) => const EnterNamePage(),
          ),
          GoRoute(
            path: 'profile',
            builder: (_, __) => const ProfilePage(),
          ),
          GoRoute(
            path: 'suggest',
            builder: (_, __) => const SuggestPage(),
          ),
        ],
      ),
    ],
  );

  RouterConfig<Object> get routerConfig => _router;
}
