import 'package:bloc/bloc.dart';

import '../meditation/domain/meditation_repository.dart';
import '../meditation/meditation_item.dart';

part 'playlist_state.dart';

class PlaylistViewModel extends Cubit<PlaylistState> {
  final MeditationRepository meditationRepository;

  PlaylistViewModel({
    required this.meditationRepository,
  }) : super(PlaylistStateIdle());

  Future<void> onInit({required String categoryName}) async {
    final meditations = meditationRepository.meditations
        ?.where(
          (element) => element.category == categoryName,
        )
        .toList();

    if (categoryName == 'Для вас') {
      emit(PlaylistStateLoading());
      await Future.delayed(const Duration(seconds: 1));
    }

    emit(
      PlaylistStateData(
        categoryName: categoryName,
        playlistItems: meditations
                ?.map(
                  (it) => MeditationItem(
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
