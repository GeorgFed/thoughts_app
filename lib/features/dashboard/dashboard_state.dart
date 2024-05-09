part of 'dashboard_view_model.dart';

sealed class DashboardState {}

final class DashboardStateIdle extends DashboardState {}

final class DashboardStateLoading extends DashboardState {}

final class DashboardStateError extends DashboardState {
  final String message;
  final String? title;

  DashboardStateError({
    required this.message,
    this.title,
  });
}

final class DashboardStateData extends DashboardState {
  final String name;
  final List<MeditationPromoItem> suggestedMeditations;
  final List<PlaylistItem> categories;

  DashboardStateData({
    required this.name,
    required this.suggestedMeditations,
    required this.categories,
  });

  static DashboardStateData fromData(
    String name,
    List<MeditationModel> recommendedMeditations,
    List<CategoryModel> categories,
  ) =>
      DashboardStateData(
        name: 'Егор',
        suggestedMeditations: recommendedMeditations
            .map(
              (it) => MeditationPromoItem(
                title: it.title,
                imageUrl: it.coverUrl,
                id: it.id.toString(),
              ),
            )
            .toList(),
        categories: categories
            .map(
              (it) => PlaylistItem(
                title: it.name,
                id: it.id.toString(),
              ),
            )
            .toList(),
      );
}

class MeditationPromoItem {
  final String title;
  final String imageUrl;
  final String id;

  const MeditationPromoItem({
    required this.title,
    required this.imageUrl,
    required this.id,
  });
}

class PlaylistItem {
  final String title;
  final String id;

  const PlaylistItem({
    required this.title,
    required this.id,
  });
}
