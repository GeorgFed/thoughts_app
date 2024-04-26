import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/ta_tag.dart';
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PlaylistViewModel, PlaylistState>(
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
                      onTap: () => context.go('/meditation/${e.id}'),
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
}

class MeditationListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;
  final List<String> tags;
  final String coverUrl;

  const MeditationListTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.tags,
    required this.coverUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.cardColor,
                image: DecorationImage(
                  // Apply color filter to darken image
                  colorFilter: const ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                  image: AssetImage(coverUrl),
                ),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subtitle,
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tags
                    .map(
                      (it) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TATag(
                          text: it,
                          size: TATagSize.small,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
