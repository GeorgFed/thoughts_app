import 'package:bloc/bloc.dart';

import '../auth/domain/auth_repository.dart';

part 'profile_state.dart';

class ProfileViewModel extends Cubit<ProfileState> {
  final AuthRepository authRepository;

  ProfileViewModel(
    this.authRepository,
  ) : super(ProfileStateIdle());

  void onSignOut() => authRepository.signOut();
}
