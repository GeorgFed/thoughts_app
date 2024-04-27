import 'model/meditation_model.dart';

abstract class MeditationRepository {
  Future<List<MeditationModel>?> getMeditations();

  List<MeditationModel>? get meditations;
}
