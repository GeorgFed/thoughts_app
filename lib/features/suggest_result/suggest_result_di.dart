import 'package:riverpod/riverpod.dart';

import '../../core/di/app_di.dart';
import 'suggest_result_view_model.dart';

abstract class SuggestResultDi {
  static final viewModel = Provider(
    (ref) => SuggestResultViewModel(
      ref.watch(AppDi.meditationRepository),
      ref.watch(AppDi.chatbotRepository),
    ),
  );
}
