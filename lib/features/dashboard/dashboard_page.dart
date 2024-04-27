import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/ta_button.dart';
import '../../common/widgets/ta_pulsating_button.dart';
import '../../common/widgets/ta_tag.dart';
import 'dashboard_di.dart';
import 'dashboard_view_model.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(DashboardDi.viewModel)..onInit(),
          child: const _DashboardView(),
        ),
      );
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<DashboardViewModel, DashboardState>(
      builder: (context, state) => switch (state) {
        DashboardStateIdle() => const SizedBox.shrink(),
        DashboardStateLoading() => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        DashboardStateData(
          :final name,
          :final meditationPromo,
          :final playlists,
        ) =>
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(128),
              child: AppBar(
                toolbarHeight: 128,
                title: Padding(
                  padding: const EdgeInsets.only(top: 44),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Привет, $name',
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.person_outline_rounded),
                        onPressed: () => context.push('/profile'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: const EdgeInsets.all(8),
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              // Apply color filter to darken image
                              colorFilter: const ColorFilter.mode(
                                Colors.black26,
                                BlendMode.darken,
                              ),
                              image: AssetImage(
                                meditationPromo[index].image,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Spacer(flex: 2),
                              Text(
                                meditationPromo[index].title,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: GestureDetector(
                      onTap: () => context.push('/profile'),
                      child: Container(
                        height: 64,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Поиск',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Категории',
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Row(
                            children: playlists
                                .asMap()
                                .entries
                                .where((element) => element.key.isOdd)
                                .map(
                                  (entry) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: TATag(
                                      text: entry.value.title,
                                      onTap: () => context.push(
                                        '/playlist/${entry.value.title}',
                                      ),
                                      size: TATagSize.large,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: playlists
                                .asMap()
                                .entries
                                .where((element) => element.key.isEven)
                                .map(
                                  (entry) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: TATag(
                                      text: entry.value.title,
                                      onTap: () => context.push(
                                        '/playlist/${entry.value.title}',
                                      ),
                                      size: TATagSize.large,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Stack(
                    children: [
                      const TAPulsatingBlob(
                        minHeight: 24,
                        maxHeight: 24,
                        minWidth: 44,
                        maxWidth: 64,
                        minBlurRadius: 24,
                        maxBlurRadius: 48,
                        animationDuration: Duration(seconds: 3),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 44.0),
                        child: TAButton(
                          text: 'Подобрать медитацию',
                          onPressed: () => context.push('/suggest'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      },
    );
  }
}
