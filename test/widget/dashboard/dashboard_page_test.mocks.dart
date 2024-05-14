// Mocks generated by Mockito 5.4.4 from annotations
// in thoughts_app/test/widget/dashboard/dashboard_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:bloc/bloc.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:thoughts_app/features/auth/domain/auth_repository.dart' as _i3;
import 'package:thoughts_app/features/dashboard/dashboard_view_model.dart'
    as _i5;
import 'package:thoughts_app/features/meditation/domain/meditation_repository.dart'
    as _i2;
import 'package:thoughts_app/features/profile/domain/profile_repository.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMeditationRepository_0 extends _i1.SmartFake
    implements _i2.MeditationRepository {
  _FakeMeditationRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthRepository_1 extends _i1.SmartFake
    implements _i3.AuthRepository {
  _FakeAuthRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProfileRepository_2 extends _i1.SmartFake
    implements _i4.ProfileRepository {
  _FakeProfileRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DashboardViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockDashboardViewModel extends _i1.Mock
    implements _i5.DashboardViewModel {
  MockDashboardViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MeditationRepository get meditationRepository => (super.noSuchMethod(
        Invocation.getter(#meditationRepository),
        returnValue: _FakeMeditationRepository_0(
          this,
          Invocation.getter(#meditationRepository),
        ),
      ) as _i2.MeditationRepository);

  @override
  _i3.AuthRepository get authRepository => (super.noSuchMethod(
        Invocation.getter(#authRepository),
        returnValue: _FakeAuthRepository_1(
          this,
          Invocation.getter(#authRepository),
        ),
      ) as _i3.AuthRepository);

  @override
  _i4.ProfileRepository get profileRepository => (super.noSuchMethod(
        Invocation.getter(#profileRepository),
        returnValue: _FakeProfileRepository_2(
          this,
          Invocation.getter(#profileRepository),
        ),
      ) as _i4.ProfileRepository);

  @override
  _i5.DashboardState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i6.dummyValue<_i5.DashboardState>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.DashboardState);

  @override
  _i7.Stream<_i5.DashboardState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i7.Stream<_i5.DashboardState>.empty(),
      ) as _i7.Stream<_i5.DashboardState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i7.Future<void> onInit() => (super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  void emit(_i5.DashboardState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i8.Change<_i5.DashboardState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}