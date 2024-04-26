import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/meditation/data/meditation_repository_impl.dart';
import '../features/meditation/meditation_repository.dart';

abstract class AppDi {
  static final meditationRepository =
      Provider.autoDispose<MeditationRepository>(
    (_) => MeditationRepositoryImpl(),
  );
}
