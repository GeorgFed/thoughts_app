part of 'player_view_model.dart';

sealed class PlayerPageState {}

final class PlayerStateIdle extends PlayerPageState {}

final class PlayerStateNotFound extends PlayerPageState {}

final class PlayerStateData extends PlayerPageState {
  final int trackIndex;
  final List<TrackItem> trackItems;

  PlayerStateData({
    required this.trackIndex,
    required this.trackItems,
  });

  PlayerStateData copyWith({
    int? trackIndex,
    List<TrackItem>? trackItems,
  }) =>
      PlayerStateData(
        trackIndex: trackIndex ?? this.trackIndex,
        trackItems: trackItems ?? this.trackItems,
      );

  TrackItem get currentTrack => trackItems[trackIndex];

  bool get isFirstTrack => trackIndex == 0;

  bool get isLastTrack => trackIndex == trackItems.length - 1;
}

final class TrackItem {
  final String trackTitle;
  final String trackUrl;
  final String author;
  final String coverUrl;

  TrackItem({
    required this.trackTitle,
    required this.trackUrl,
    required this.author,
    required this.coverUrl,
  });
}
