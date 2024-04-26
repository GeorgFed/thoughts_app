part of 'playlist_view_model.dart';

sealed class PlaylistState {}

class PlaylistStateIdle implements PlaylistState {}

class PlaylistStateLoading implements PlaylistState {}

class PlaylistStateData implements PlaylistState {
  final String categoryName;
  final List<PlaylistItem> playlistItems;

  PlaylistStateData({
    required this.categoryName,
    required this.playlistItems,
  });
}

class PlaylistItem {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final List<String> tags;

  PlaylistItem({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.tags,
  });
}
