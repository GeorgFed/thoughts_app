part of 'playlist_view_model.dart';

sealed class PlaylistState {}

class PlaylistStateIdle implements PlaylistState {}

class PlaylistStateLoading implements PlaylistState {}

class PlaylistStateData implements PlaylistState {
  final String categoryName;
  final List<MeditationItem> playlistItems;

  PlaylistStateData({
    required this.categoryName,
    required this.playlistItems,
  });
}
