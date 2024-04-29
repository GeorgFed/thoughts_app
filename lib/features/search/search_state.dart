part of 'search_view_model.dart';

sealed class SearchState {}

final class SearchStateIdle extends SearchState {}

final class SearchStateData extends SearchState {
  final List<MeditationItem> meditationItems;

  SearchStateData({required this.meditationItems});
}

final class SearchStateNoResults extends SearchState {}
