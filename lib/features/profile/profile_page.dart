import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/ta_banner.dart';
import 'profile_di.dart';
import 'profile_view_model.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) => BlocProvider.value(
          value: ref.watch(ProfileDi.viewModel),
          child: const ProfilePage(),
        ),
      );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProfileViewModel, ProfileState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  Text(
                    'Егор',
                    style: theme.textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TABanner(
                title: 'Вы – эксперт',
                text:
                    'Вы уже прошли 40 сессий медитаций – продолжайте в том же духе! До следующего уровня осталось 10 сессий',
                footer: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    LinearProgressIndicator(
                      value: 0.5,
                      color: theme.primaryColor,
                      backgroundColor: theme.sliderTheme.thumbColor,
                      borderRadius: BorderRadius.circular(8),
                      minHeight: 8,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Настройки',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text(
                'Темная тема',
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Аккаунт',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Выйти из аккаунта',
                style: TextStyle(
                  color: theme.colorScheme.error,
                ),
              ),
              onTap: () {
                context.read<ProfileViewModel>().onSignOut();
                context.go('sign_up');
              },
              trailing: Icon(
                Icons.chevron_right,
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
