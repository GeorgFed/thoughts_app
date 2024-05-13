import 'package:bloc/bloc.dart';

import '../auth/domain/auth_repository.dart';
import 'domain/profile_repository.dart';

part 'profile_state.dart';

class ProfileViewModel extends Cubit<ProfileState> {
  final AuthRepository authRepository;
  final ProfileRepository profileRepository;

  ProfileViewModel(
    this.authRepository,
    this.profileRepository,
  ) : super(ProfileStateIdle());

  Future<void> onInit() async {
    emit(ProfileStateLoading());
    final name = await profileRepository.getUserName();
    emit(ProfileStateData(name: name));
  }

  Future<void> onSignOut() async {
    await profileRepository.clearUserData();
    authRepository.signOut();
    emit(ProfileStateSignedOut());
  }
}
