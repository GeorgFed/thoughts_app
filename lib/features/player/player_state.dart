part of 'player_view_model.dart';

sealed class PlayerPageState {}

final class PlayerStateIdle extends PlayerPageState {}

final class PlayerStateNotFound extends PlayerPageState {}

final class PlayerStateData extends PlayerPageState {
  final String trackTitle;
  final String trackUrl;
  final String author;
  final String coverUrl;

  PlayerStateData({
    required this.trackTitle,
    required this.trackUrl,
    required this.author,
    required this.coverUrl,
  });
}
