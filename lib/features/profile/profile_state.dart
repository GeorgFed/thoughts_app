part of 'profile_view_model.dart';

sealed class ProfileState {}

final class ProfileStateIdle extends ProfileState {}

final class ProfileStateLoading extends ProfileState {}

final class ProfileStateData extends ProfileState {
  final String name;

  ProfileStateData({required this.name});
}

final class ProfileStateSignedOut extends ProfileState {}
