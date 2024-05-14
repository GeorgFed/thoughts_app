// Mocks generated by Mockito 5.4.4 from annotations
// in thoughts_app/test/unit/player/player_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:thoughts_app/features/meditation/domain/meditation_repository.dart'
    as _i2;
import 'package:thoughts_app/features/meditation/domain/model/category_model.dart'
    as _i5;
import 'package:thoughts_app/features/meditation/domain/model/meditation_model.dart'
    as _i6;
import 'package:thoughts_app/features/meditation/domain/model/narrator_model.dart'
    as _i4;
import 'package:thoughts_app/features/session/session_repository_impl.dart'
    as _i7;

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

/// A class which mocks [MeditationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMeditationRepository extends _i1.Mock
    implements _i2.MeditationRepository {
  MockMeditationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> fetchData() => (super.noSuchMethod(
        Invocation.method(
          #fetchData,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i4.NarratorModel? narratorById(String? narratorId) =>
      (super.noSuchMethod(Invocation.method(
        #narratorById,
        [narratorId],
      )) as _i4.NarratorModel?);

  @override
  _i5.CategoryModel? categoryById(String? categoryId) =>
      (super.noSuchMethod(Invocation.method(
        #categoryById,
        [categoryId],
      )) as _i5.CategoryModel?);

  @override
  List<_i6.MeditationModel>? meditationsByCategory(String? categoryId) =>
      (super.noSuchMethod(Invocation.method(
        #meditationsByCategory,
        [categoryId],
      )) as List<_i6.MeditationModel>?);
}

/// A class which mocks [SessionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSessionRepository extends _i1.Mock implements _i7.SessionRepository {
  MockSessionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> addMeditationSession({required String? meditationId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #addMeditationSession,
          [],
          {#meditationId: meditationId},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}