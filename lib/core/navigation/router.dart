import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/auth_repository.dart';
import '../../features/auth/ui/sign_in/sign_in_page.dart';
import '../../features/auth/ui/sign_up/enter_name_page.dart';
import '../../features/auth/ui/sign_up/sign_up_page.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/onboarding/domain/onboarding_repository.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/player/player_page.dart';
import '../../features/playlist/playlist_page.dart';
import '../../features/profile/domain/profile_repository.dart';
import '../../features/profile/profile_page.dart';
import '../../features/search/search_page.dart';
import '../../features/suggest/suggest_page.dart';
import '../../features/suggest_result/suggest_result_page.dart';

class AppRouter {
  final AuthRepository authRepository;
  final OnboardingRepository onboardingRepository;
  final ProfileRepository profileRepository;

  AppRouter({
    required this.authRepository,
    required this.onboardingRepository,
    required this.profileRepository,
  });

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    redirect: (_, state) async {
      final onboardingComplete = await onboardingRepository.isOnboardingShown;

      if (!onboardingComplete && state.matchedLocation == '/') {
        return null;
      }

      final hasAuthenticatedUser = await authRepository.hasAuthenticatedUser;

      if (!hasAuthenticatedUser && state.matchedLocation == '/') {
        return '/sign_up';
      }

      final registrationComplete = await profileRepository.hasUserData;

      if (!registrationComplete && state.matchedLocation == '/') {
        return '/enter_name';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const OnboardingPage(),
        routes: [
          GoRoute(
            path: 'sign_up',
            builder: (_, __) => const SignUpPage(),
          ),
          GoRoute(
            path: 'playlist/:categoryId',
            builder: (_, state) {
              final categoryId = state.pathParameters['categoryId'] ?? '';
              return PlaylistPage(categoryId: categoryId);
            },
          ),
          GoRoute(
            path: 'player/:trackId',
            builder: (_, state) {
              final trackId = state.pathParameters['trackId'] ?? '';
              return PlayerPage(trackId: trackId);
            },
          ),
          GoRoute(
            path: 'sign_in',
            builder: (_, __) => const SignInPage(),
          ),
          GoRoute(
            path: 'dashboard',
            builder: (_, __) => const DashboardPage(),
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
          GoRoute(
            path: 'suggest_result',
            builder: (_, __) => const SuggestResultPage(),
          ),
          GoRoute(
            path: 'search',
            pageBuilder: (_, __) => CustomTransitionPage(
              child: const SearchPage(),
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) =>
                  SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.ease,
                  ),
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    ],
  );

  RouterConfig<Object> get routerConfig => _router;
}
