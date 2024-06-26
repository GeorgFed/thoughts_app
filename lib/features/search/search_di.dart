import 'package:riverpod/riverpod.dart';

import '../../core/di/app_di.dart';
import 'search_view_model.dart';

abstract class SearchDi {
  static final viewModel = Provider.autoDispose(
    (ref) => SearchViewModel(
      meditationRepository: ref.watch(
        AppDi.meditationRepository,
      ),
    ),
  );
}
