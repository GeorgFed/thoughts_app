import 'package:bloc/bloc.dart';

import '../../core/network/exceptions/network_exception.dart';
import '../auth/domain/auth_repository.dart';
import '../meditation_progress/domain/meditation_progress_repository.dart';
import '../meditation_progress/domain/models/meditation_progress_model.dart';
import 'domain/profile_repository.dart';

part 'profile_state.dart';

class ProfileViewModel extends Cubit<ProfileState> {
  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final MeditationProgressRepository meditationProgressRepository;

  ProfileViewModel(
    this.authRepository,
    this.profileRepository,
    this.meditationProgressRepository,
  ) : super(ProfileStateIdle());

  Future<void> onInit() async {
    try {
      emit(ProfileStateLoading());
      final name = await profileRepository.getUserName();
      final progress = await meditationProgressRepository.getProgress();

      emit(
        ProfileStateData(
          name: name,
          progress: progress,
        ),
      );
    } on NetworkException catch (e) {
      emit(
        ProfileStateError(message: e.message),
      );
    }
  }

  Future<void> onNameUpdate(String newName) async {
    if (state is! ProfileStateData) return;

    final name = (state as ProfileStateData).name;
    final progress = (state as ProfileStateData).progress;
    if (name == newName) return;

    emit(ProfileStateLoading());
    try {
      await profileRepository.updateUserName(newName);
      emit(
        ProfileStateData(
          name: newName,
          progress: progress,
        ),
      );
    } on NetworkException catch (e) {
      emit(
        ProfileStateError(message: e.message),
      );
    }
  }

  Future<void> onSignOut() async {
    await profileRepository.clearUserData();
    authRepository.signOut();
    emit(ProfileStateSignedOut());
  }
}
