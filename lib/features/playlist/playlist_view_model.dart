import 'package:bloc/bloc.dart';

import '../meditation/domain/meditation_repository.dart';
import '../meditation/meditation_item.dart';

part 'playlist_state.dart';

class PlaylistViewModel extends Cubit<PlaylistState> {
  final MeditationRepository meditationRepository;

  PlaylistViewModel({
    required this.meditationRepository,
  }) : super(PlaylistStateIdle());

  void onInit({required String categoryId}) {
    final category = meditationRepository.categoryById(
      categoryId,
    );
    final meditationsForCategory = meditationRepository.meditationsByCategory(
      categoryId,
    );

    emit(
      PlaylistStateData(
        categoryName: category?.name ?? '',
        playlistItems: meditationsForCategory
                ?.map(
                  (it) => MeditationItem(
                    id: it.id,
                    title: it.title,
                    author: it.narrator?.name ?? '',
                    coverUrl: it.coverUrl,
                    tags: it.tags,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
