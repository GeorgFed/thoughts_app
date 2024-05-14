import 'package:riverpod/riverpod.dart';

import '../../core/di/app_di.dart';
import 'suggest_view_model.dart';

abstract class SuggestDi {
  static final viewModel = Provider(
    (ref) => SuggestViewModel(
      chatbotRepository: ref.watch(AppDi.chatbotRepository),
    ),
  );
}
