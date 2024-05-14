import 'domain/model/meditation_model.dart';

class MeditationItem {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final List<String> tags;

  MeditationItem({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.tags,
  });

  static MeditationItem fromModel(MeditationModel model) => MeditationItem(
        id: model.id,
        title: model.title,
        author: model.narrator?.name ?? '',
        coverUrl: model.coverUrl,
        tags: model.tags,
      );
}
