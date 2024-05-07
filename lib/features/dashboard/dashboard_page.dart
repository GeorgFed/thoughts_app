import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/image_getter.dart';
import '../../common/widgets/ta_button.dart';
import '../../common/widgets/ta_pulsating_button.dart';
import '../../common/widgets/ta_tag.dart';
import '../../common/widgets/ta_text_field.dart';
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
          :final suggestedMeditations,
          :final categories,
        ) =>
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(128),
              child: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 128,
                title: Padding(
                  padding: const EdgeInsets.only(top: 44),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Привет, $name',
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.person,
                          size: 32,
                        ),
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
                      children: suggestedMeditations
                          .map(
                            (it) => GestureDetector(
                              onTap: () => context.push('/player/${it.id}'),
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black26,
                                      BlendMode.darken,
                                    ),
                                    image: ImageGetter.image(it.imageUrl),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Spacer(flex: 2),
                                    Text(
                                      it.title,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: GestureDetector(
                      onTap: () => context.push('/search'),
                      child: const TATextField(
                        hint: 'Поиск',
                        isEditable: false,
                        centerHint: true,
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
                            children: categories
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
                                        '/playlist/${entry.value.id}',
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
                            children: categories
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
                                        '/playlist/${entry.value.id}',
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
