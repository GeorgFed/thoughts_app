import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../meditation/meditation_list_tile.dart';
import 'playlist_di.dart';
import 'playlist_view_model.dart';

class PlaylistPage extends StatelessWidget {
  final String categoryName;

  const PlaylistPage(
    this.categoryName, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(PlaylistDi.viewModel)
            ..onInit(
              categoryName: categoryName,
            ),
          child: const _PlaylistView(),
        ),
      );
}

class _PlaylistView extends StatelessWidget {
  const _PlaylistView();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PlaylistViewModel, PlaylistState>(
        builder: (context, state) => switch (state) {
          PlaylistStateIdle() => const SizedBox.shrink(),
          PlaylistStateLoading() => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          PlaylistStateData(
            :final categoryName,
            :final playlistItems,
          ) =>
            Scaffold(
              appBar: AppBar(
                title: Text(
                  categoryName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: ListView(
                children: playlistItems
                    .map(
                      (e) => MeditationListTile(
                        title: e.title,
                        subtitle: e.author,
                        onTap: () => context.push('/player/${e.id}'),
                        tags: e.tags,
                        coverUrl: e.coverUrl,
                      ),
                    )
                    .toList(),
              ),
            ),
        },
      );
}
