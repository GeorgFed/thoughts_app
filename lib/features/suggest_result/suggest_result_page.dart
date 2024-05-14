import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../meditation/meditation_list_tile.dart';
import 'suggest_result_di.dart';
import 'suggest_result_view_model.dart';

class SuggestResultPage extends StatelessWidget {
  const SuggestResultPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(SuggestResultDi.viewModel)..onInit(),
          child: const _SuggestResultView(),
        ),
      );
}

class _SuggestResultView extends StatelessWidget {
  const _SuggestResultView();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SuggestResultViewModel, SuggestResultState>(
        builder: (context, state) => switch (state) {
          SuggestResultStateIdle() => const SizedBox.shrink(),
          SuggestResultStateData(
            :final message,
            :final playlistItems,
          ) =>
            Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Подобрано для вас',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.bubble_chart_outlined),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text(message),
                        ),
                      ],
                    ),
                  ),
                  ...playlistItems.map(
                    (e) => MeditationListTile(
                      title: e.title,
                      subtitle: e.author,
                      onTap: () => context.push('/player/${e.id}'),
                      tags: e.tags,
                      coverUrl: e.coverUrl,
                    ),
                  ),
                ],
              ),
            ),
          SuggestResultStateError() => const SizedBox.shrink(),
        },
      );
}
