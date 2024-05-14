import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/core/network/exceptions/network_exception.dart';
import 'package:thoughts_app/features/auth/domain/auth_repository.dart';
import 'package:thoughts_app/features/auth/ui/auth_state.dart';
import 'package:thoughts_app/features/auth/ui/auth_view_model.dart';
import 'package:thoughts_app/features/profile/domain/profile_repository.dart';

import 'auth_view_model_test.mocks.dart';

@GenerateMocks([AuthRepository, ProfileRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late MockProfileRepository mockProfileRepository;
  late AuthViewModel authViewModel;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockProfileRepository = MockProfileRepository();
    authViewModel = AuthViewModel(mockAuthRepository, mockProfileRepository);
  });

  group('AuthViewModel - onSignUp', () {
    blocTest<AuthViewModel, AuthState>(
      'emits [AuthStateLoading, AuthStateLoggedIn] when signUp is successful',
      build: () {
        when(mockAuthRepository.signUp(any, any)).thenAnswer((_) async => {});
        return authViewModel;
      },
      act: (bloc) =>
          bloc.onSignUp(email: 'test@example.com', password: 'password123'),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateLoggedIn>(),
      ],
      verify: (_) {
        verify(mockAuthRepository.signUp(any, any)).called(1);
      },
    );

    blocTest<AuthViewModel, AuthState>(
      'emits [AuthStateLoading, AuthStateError] when NetworkException is thrown during signUp',
      build: () {
        when(mockAuthRepository.signUp(any, any))
            .thenThrow(NetworkException(message: 'Network error'));
        return authViewModel;
      },
      act: (bloc) =>
          bloc.onSignUp(email: 'test@example.com', password: 'password123'),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateError>(),
      ],
      verify: (_) {
        verify(mockAuthRepository.signUp(any, any)).called(1);
      },
    );
  });

  group('AuthViewModel - enterName', () {
    blocTest<AuthViewModel, AuthState>(
      'emits [AuthStateLoading, AuthStateRegistrationComplete] when enterName is successful',
      build: () {
        when(mockProfileRepository.updateUserName(any))
            .thenAnswer((_) async => {});
        return authViewModel;
      },
      act: (bloc) => bloc.enterName('John Doe'),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateRegistrationComplete>(),
      ],
      verify: (_) {
        verify(mockProfileRepository.updateUserName(any)).called(1);
      },
    );

    blocTest<AuthViewModel, AuthState>(
      'emits [AuthStateLoading, AuthStateError] when NetworkException is thrown during enterName',
      build: () {
        when(mockProfileRepository.updateUserName(any))
            .thenThrow(NetworkException(message: 'Network error'));
        return authViewModel;
      },
      act: (bloc) => bloc.enterName('John Doe'),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateError>(),
      ],
      verify: (_) {
        verify(mockProfileRepository.updateUserName(any)).called(1);
      },
    );
  });

  group('AuthViewModel - onSignIn', () {
    blocTest<AuthViewModel, AuthState>(
      'emits [AuthStateLoading, AuthStateLoggedIn] when signIn is successful',
      build: () {
        when(mockAuthRepository.signIn(any, any)).thenAnswer((_) async => {});
        return authViewModel;
      },
      act: (bloc) =>
          bloc.onSignIn(email: 'test@example.com', password: 'password123'),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateLoggedIn>(),
      ],
      verify: (_) {
        verify(mockAuthRepository.signIn(any, any)).called(1);
      },
    );

    blocTest<AuthViewModel, AuthState>(
      'emits [AuthStateLoading, AuthStateError] when NetworkException is thrown during signIn',
      build: () {
        when(mockAuthRepository.signIn(any, any))
            .thenThrow(NetworkException(message: 'Network error'));
        return authViewModel;
      },
      act: (bloc) =>
          bloc.onSignIn(email: 'test@example.com', password: 'password123'),
      expect: () => [
        isA<AuthStateLoading>(),
        isA<AuthStateError>(),
      ],
      verify: (_) {
        verify(mockAuthRepository.signIn(any, any)).called(1);
      },
    );
  });
}
