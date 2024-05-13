import 'package:bloc/bloc.dart';

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
    emit(ProfileStateLoading());
    final name = await profileRepository.getUserName();
    final progress = await meditationProgressRepository.getProgress();

    emit(
      ProfileStateData(
        name: name,
        progress: progress,
      ),
    );
  }

  Future<void> onSignOut() async {
    await profileRepository.clearUserData();
    authRepository.signOut();
    emit(ProfileStateSignedOut());
  }
}
