import 'package:riverpod/riverpod.dart';

import '../../core/di/app_di.dart';
import 'player_view_model.dart';

abstract class PlayerDi {
  static final viewModel = Provider.autoDispose(
    (ref) => PlayerViewModel(
      meditationRepository: ref.watch(AppDi.meditationRepository),
      sessionRepository: ref.watch(AppDi.sessionRepository),
    ),
  );
}
