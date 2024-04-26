import 'package:bloc/bloc.dart';

import '../meditation/meditation_repository.dart';

part 'playlist_state.dart';

class PlaylistViewModel extends Cubit<PlaylistState> {
  final MeditationRepository meditationRepository;

  PlaylistViewModel({
    required this.meditationRepository,
  }) : super(PlaylistStateIdle());

  void onInit({required String categoryName}) {
    final meditations = meditationRepository.meditations
        ?.where(
          (element) => element.category == categoryName,
        )
        .toList();

    emit(
      PlaylistStateData(
        categoryName: categoryName,
        playlistItems: meditations
                ?.map(
                  (it) => PlaylistItem(
                    id: it.id.toString(),
                    title: it.title,
                    author: it.author,
                    coverUrl: it.cover,
                    tags: it.tags,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
