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

    emit(
      PlayerStateData(
        trackTitle: meditation.title,
        trackUrl: meditation.mediaFile,
        author: meditation.author,
        coverUrl: meditation.cover,
      ),
    );
  }
}
