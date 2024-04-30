import 'model/category_model.dart';
import 'model/meditation_model.dart';
import 'model/narrator_model.dart';

abstract class MeditationRepository {
  Future<void> fetchData();

  Future<List<MeditationModel>?> get meditations;

  Future<List<CategoryModel>?> get categories;

  Future<List<NarratorModel>?> get narrators;

  NarratorModel? narratorById(String narratorId);

  CategoryModel? categoryById(String categoryId);

  List<MeditationModel>? meditationsByCategory(String categoryId);
}
