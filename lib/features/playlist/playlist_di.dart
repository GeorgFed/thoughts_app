import 'package:riverpod/riverpod.dart';

import '../../common/app_di.dart';
import 'playlist_view_model.dart';

class PlaylistDi {
  static final viewModel = Provider.autoDispose(
    (ref) => PlaylistViewModel(
      meditationRepository: ref.read(AppDi.meditationRepository),
    ),
  );
}
