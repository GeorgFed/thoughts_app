// Mocks generated by Mockito 5.4.4 from annotations
// in thoughts_app/test/widget/player/player_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:thoughts_app/features/meditation/domain/meditation_repository.dart'
    as _i2;
import 'package:thoughts_app/features/player/player_view_model.dart' as _i4;
import 'package:thoughts_app/features/session/session_repository_impl.dart'
    as _i3;

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

class _FakeSessionRepository_1 extends _i1.SmartFake
    implements _i3.SessionRepository {
  _FakeSessionRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PlayerViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlayerViewModel extends _i1.Mock implements _i4.PlayerViewModel {
  MockPlayerViewModel() {
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
  _i3.SessionRepository get sessionRepository => (super.noSuchMethod(
        Invocation.getter(#sessionRepository),
        returnValue: _FakeSessionRepository_1(
          this,
          Invocation.getter(#sessionRepository),
        ),
      ) as _i3.SessionRepository);

  @override
  _i4.PlayerPageState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i5.dummyValue<_i4.PlayerPageState>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i4.PlayerPageState);

  @override
  _i6.Stream<_i4.PlayerPageState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i4.PlayerPageState>.empty(),
      ) as _i6.Stream<_i4.PlayerPageState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i6.Future<List<String>> getPlaylist(String? trackId) => (super.noSuchMethod(
        Invocation.method(
          #getPlaylist,
          [trackId],
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);

  @override
  void onInit(String? trackId) => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [trackId],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onNext() => super.noSuchMethod(
        Invocation.method(
          #onNext,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onPrevious() => super.noSuchMethod(
        Invocation.method(
          #onPrevious,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i4.PlayerPageState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i7.Change<_i4.PlayerPageState>? change) => super.noSuchMethod(
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
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}