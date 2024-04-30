part of 'dashboard_view_model.dart';

sealed class DashboardState {}

final class DashboardStateIdle extends DashboardState {}

final class DashboardStateLoading extends DashboardState {}

final class DashboardStateData extends DashboardState {
  final String name;
  final List<MeditationPromoItem> suggestedMeditations;
  final List<PlaylistItem> categories;

  DashboardStateData({
    required this.name,
    required this.suggestedMeditations,
    required this.categories,
  });
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
