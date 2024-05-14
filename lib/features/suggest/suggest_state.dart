part of 'suggest_view_model.dart';

sealed class SuggestState {}

final class SuggestStateIdle extends SuggestState {}

final class SuggestStateLoading extends SuggestState {}

final class SuggestStateError extends SuggestState {
  final String message;

  SuggestStateError(this.message);
}

final class SuggestStateResult extends SuggestState {}
