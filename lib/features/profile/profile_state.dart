part of 'profile_view_model.dart';

sealed class ProfileState {}

final class ProfileStateIdle extends ProfileState {}

final class ProfileStateLoading extends ProfileState {}
