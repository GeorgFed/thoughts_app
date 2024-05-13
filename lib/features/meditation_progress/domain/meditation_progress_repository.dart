import 'models/meditation_progress_model.dart';

abstract class MeditationProgressRepository {
  Future<MeditationProgressModel> getProgress();
}
