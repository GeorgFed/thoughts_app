import 'package:bloc/bloc.dart';

import '../../common/logger.dart';
import '../meditation/domain/meditation_repository.dart';

part 'player_state.dart';

class PlayerViewModel extends Cubit<PlayerPageState> {
  final MeditationRepository meditationRepository;
  PlayerViewModel({
    required this.meditationRepository,
  }) : super(PlayerStateIdle());

  Future<void> onInit(String trackId) async {
    final meditation = meditationRepository.meditations?.firstWhere(
      (element) => element.id.toString() == trackId,
    );

    if (meditation == null) {
      logger.e('Failed to get meditation for id: $trackId');
      emit(PlayerStateNotFound());
      return;
    }

    final playlist = meditationRepository.meditations
        ?.where((element) => element.category == meditation.category)
        .toList();

    final meditationIndex = playlist?.indexWhere(
      (element) => element.id == meditation.id,
    );

    emit(
      PlayerStateData(
        trackIndex: meditationIndex ?? 0,
        trackItems: playlist
                ?.map(
                  (it) => TrackItem(
                    trackTitle: it.title,
                    author: it.author,
                    coverUrl: it.cover,
                    trackUrl: it.mediaFile,
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
