// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meditation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeditationModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get coverUrl => throw _privateConstructorUsedError;
  String get trackUrl => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  NarratorModel? get narrator => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeditationModelCopyWith<MeditationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeditationModelCopyWith<$Res> {
  factory $MeditationModelCopyWith(
          MeditationModel value, $Res Function(MeditationModel) then) =
      _$MeditationModelCopyWithImpl<$Res, MeditationModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String coverUrl,
      String trackUrl,
      List<String> tags,
      NarratorModel? narrator,
      CategoryModel? category});

  $NarratorModelCopyWith<$Res>? get narrator;
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$MeditationModelCopyWithImpl<$Res, $Val extends MeditationModel>
    implements $MeditationModelCopyWith<$Res> {
  _$MeditationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? coverUrl = null,
    Object? trackUrl = null,
    Object? tags = null,
    Object? narrator = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      trackUrl: null == trackUrl
          ? _value.trackUrl
          : trackUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      narrator: freezed == narrator
          ? _value.narrator
          : narrator // ignore: cast_nullable_to_non_nullable
              as NarratorModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NarratorModelCopyWith<$Res>? get narrator {
    if (_value.narrator == null) {
      return null;
    }

    return $NarratorModelCopyWith<$Res>(_value.narrator!, (value) {
      return _then(_value.copyWith(narrator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeditationModelImplCopyWith<$Res>
    implements $MeditationModelCopyWith<$Res> {
  factory _$$MeditationModelImplCopyWith(_$MeditationModelImpl value,
          $Res Function(_$MeditationModelImpl) then) =
      __$$MeditationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String coverUrl,
      String trackUrl,
      List<String> tags,
      NarratorModel? narrator,
      CategoryModel? category});

  @override
  $NarratorModelCopyWith<$Res>? get narrator;
  @override
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$MeditationModelImplCopyWithImpl<$Res>
    extends _$MeditationModelCopyWithImpl<$Res, _$MeditationModelImpl>
    implements _$$MeditationModelImplCopyWith<$Res> {
  __$$MeditationModelImplCopyWithImpl(
      _$MeditationModelImpl _value, $Res Function(_$MeditationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? coverUrl = null,
    Object? trackUrl = null,
    Object? tags = null,
    Object? narrator = freezed,
    Object? category = freezed,
  }) {
    return _then(_$MeditationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: null == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      trackUrl: null == trackUrl
          ? _value.trackUrl
          : trackUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      narrator: freezed == narrator
          ? _value.narrator
          : narrator // ignore: cast_nullable_to_non_nullable
              as NarratorModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ));
  }
}

/// @nodoc

class _$MeditationModelImpl implements _MeditationModel {
  _$MeditationModelImpl(
      {required this.id,
      required this.title,
      required this.coverUrl,
      required this.trackUrl,
      required final List<String> tags,
      this.narrator,
      this.category})
      : _tags = tags;

  @override
  final String id;
  @override
  final String title;
  @override
  final String coverUrl;
  @override
  final String trackUrl;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final NarratorModel? narrator;
  @override
  final CategoryModel? category;

  @override
  String toString() {
    return 'MeditationModel(id: $id, title: $title, coverUrl: $coverUrl, trackUrl: $trackUrl, tags: $tags, narrator: $narrator, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeditationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.trackUrl, trackUrl) ||
                other.trackUrl == trackUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.narrator, narrator) ||
                other.narrator == narrator) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, coverUrl, trackUrl,
      const DeepCollectionEquality().hash(_tags), narrator, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeditationModelImplCopyWith<_$MeditationModelImpl> get copyWith =>
      __$$MeditationModelImplCopyWithImpl<_$MeditationModelImpl>(
          this, _$identity);
}

abstract class _MeditationModel implements MeditationModel {
  factory _MeditationModel(
      {required final String id,
      required final String title,
      required final String coverUrl,
      required final String trackUrl,
      required final List<String> tags,
      final NarratorModel? narrator,
      final CategoryModel? category}) = _$MeditationModelImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get coverUrl;
  @override
  String get trackUrl;
  @override
  List<String> get tags;
  @override
  NarratorModel? get narrator;
  @override
  CategoryModel? get category;
  @override
  @JsonKey(ignore: true)
  _$$MeditationModelImplCopyWith<_$MeditationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
