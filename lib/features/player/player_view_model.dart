import 'package:bloc/bloc.dart';

import '../../common/logger.dart';
import '../meditation/domain/meditation_repository.dart';
import '../session/session_repository_impl.dart';

part 'player_state.dart';

class PlayerViewModel extends Cubit<PlayerPageState> {
  final MeditationRepository meditationRepository;
  final SessionRepository sessionRepository;

  PlayerViewModel({
    required this.meditationRepository,
    required this.sessionRepository,
  }) : super(PlayerStateIdle());

  Future<List<String>> getPlaylist(String trackId) async {
    final meditations = meditationRepository.meditations;
    final meditation = meditations?.firstWhere(
      (element) => element.id.toString() == trackId,
    );

    final category = meditationRepository.meditationsByCategory(
      meditation?.category?.id ?? '',
    );

    return category?.map((it) => it.trackUrl).toList() ?? [];
  }

  void onInit(String trackId) {
    final meditations = meditationRepository.meditations;
    final meditation = meditations?.firstWhere(
      (element) => element.id.toString() == trackId,
    );

    if (meditation == null) {
      logger.e('Failed to get meditation for id: $trackId');
      emit(PlayerStateNotFound());
      return;
    }

    sessionRepository.addMeditationSession(
      meditationId: meditation.id,
    );

    final category = meditationRepository.meditationsByCategory(
      meditation.category?.id ?? '',
    );

    final meditationIndex = category?.indexWhere(
      (element) => element.id == meditation.id,
    );

    emit(
      PlayerStateData(
        trackIndex: meditationIndex ?? 0,
        trackItems: category
                ?.map(
                  (it) => TrackItem(
                    trackTitle: it.title,
                    author: meditation.narrator?.name ?? '',
                    coverUrl: it.coverUrl,
                    trackUrl: it.trackUrl,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }

  void onNext() {
    if (state is PlayerStateData) {
      final stateData = state as PlayerStateData;

      if (stateData.isLastTrack) {
        return;
      }

      emit(
        stateData.copyWith(
          trackIndex: stateData.trackIndex + 1,
        ),
      );
    }
  }

  void onPrevious() {
    if (state is PlayerStateData) {
      final stateData = state as PlayerStateData;

      if (stateData.isFirstTrack) {
        return;
      }

      emit(
        stateData.copyWith(
          trackIndex: stateData.trackIndex - 1,
        ),
      );
    }
  }
}
