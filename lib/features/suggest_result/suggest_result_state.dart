part of 'suggest_result_view_model.dart';

@immutable
sealed class SuggestResultState {}

final class SuggestResultStateIdle extends SuggestResultState {}

final class SuggestResultStateError extends SuggestResultState {}

final class SuggestResultStateData extends SuggestResultState {
  final String message;
  final List<MeditationItem> playlistItems;

  SuggestResultStateData({
    required this.message,
    required this.playlistItems,
  });
}
