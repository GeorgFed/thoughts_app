import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/ta_banner.dart';
import '../../common/widgets/ta_text_field.dart';
import '../meditation_progress/domain/models/meditation_progress_model.dart';
import 'profile_di.dart';
import 'profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) => BlocProvider.value(
          value: ref.watch(ProfileDi.viewModel)..onInit(),
          child: const _ProfileView(),
        ),
      );
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProfileViewModel, ProfileState>(
        listener: (context, state) {
          if (state is ProfileStateSignedOut) {
            context.go('/');
          }
        },
        builder: (context, state) => switch (state) {
          ProfileStateLoading() => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ProfileStateData(
            :final name,
            :final progress,
          ) =>
            _ProfileDashboard(
              name: name,
              progress: progress,
            ),
          ProfileStateError() => const _ProfileDashboard(),
          ProfileStateIdle() => const SizedBox.shrink(),
          ProfileStateSignedOut() => const SizedBox.shrink(),
        },
      );
}

class _ProfileDashboard extends StatelessWidget {
  final String? name;
  final MeditationProgressModel? progress;

  const _ProfileDashboard({
    this.name,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (name != null)
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  Text(
                    name!,
                    style: theme.textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          if (progress != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TABanner(
                title: _progressTitle(progress!.levelName),
                text: _progressText(
                  progress!.currentLevelCount,
                  progress!.nextLevelCount,
                ),
                footer: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    LinearProgressIndicator(
                      value: progress!.currentLevelCount /
                          progress!.nextLevelCount,
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
          ListTile(
            title: const Text(
              'Изменить имя',
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
            onTap: () => _showChangeNameDialog(
              context,
              onUpdate: context.read<ProfileViewModel>().onNameUpdate,
            ),
          ),
          ListTile(
            title: Text(
              'Выйти из аккаунта',
              style: TextStyle(
                color: theme.colorScheme.error,
              ),
            ),
            onTap: () => context.read<ProfileViewModel>().onSignOut(),
            trailing: Icon(
              Icons.chevron_right,
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }

  void _showChangeNameDialog(
    BuildContext context, {
    required void Function(String) onUpdate,
  }) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: const Text('Изменить имя'),
        content: TATextField(
          controller: nameController,
          hint: 'Введите новое имя',
        ),
        actions: [
          TextButton(
            child: const Text('Отменить'),
            onPressed: () => context.pop(),
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              onUpdate(nameController.text);
              context.pop();
            },
          ),
        ],
      ),
    );
  }

  String _progressTitle(String level) => 'Вы – $level';

  String _progressText(int currentLevel, int nextLevel) {
    final currentLevelSessions = _pluralizeSessions(currentLevel);
    final sessionsLeft = nextLevel - currentLevel;

    if (sessionsLeft <= 0) {
      return 'Вы уже прошли $currentLevel $currentLevelSessions медитаций – продолжайте в том же духе!';
    }

    final nextLevelSessions = _pluralizeSessions(sessionsLeft);

    return 'Вы уже прошли $currentLevel $currentLevelSessions медитаций – продолжайте в том же духе! До следующего уровня осталось пройти $sessionsLeft $nextLevelSessions';
  }

  String _pluralizeSessions(int count) {
    if (count % 10 == 1 && count % 100 != 11) {
      return 'сессию';
    } else if ((count % 10 >= 2 && count % 10 <= 4) &&
        !(count % 100 >= 12 && count % 100 <= 14)) {
      return 'сессии';
    } else {
      return 'сессий';
    }
  }
}
