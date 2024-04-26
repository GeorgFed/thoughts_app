part of 'dashboard_view_model.dart';

sealed class DashboardState {}

final class DashboardStateIdle extends DashboardState {}

final class DashboardStateLoading extends DashboardState {}

final class DashboardStateData extends DashboardState {
  final String name;
  final List<MeditationPromoItem> meditationPromo;
  final List<PlaylistItem> playlists;

  DashboardStateData({
    required this.name,
    required this.meditationPromo,
    required this.playlists,
  });
}

class MeditationPromoItem {
  final String title;
  final String image;
  final String id;

  const MeditationPromoItem({
    required this.title,
    required this.image,
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
