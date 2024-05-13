part of 'profile_view_model.dart';

sealed class ProfileState {}

final class ProfileStateIdle extends ProfileState {}

final class ProfileStateLoading extends ProfileState {}

final class ProfileStateData extends ProfileState {
  final String name;
  final MeditationProgressModel progress;

  ProfileStateData({
    required this.name,
    required this.progress,
  });
}

final class ProfileStateSignedOut extends ProfileState {}
