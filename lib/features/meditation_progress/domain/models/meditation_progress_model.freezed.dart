// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meditation_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeditationProgressModel _$MeditationProgressModelFromJson(
    Map<String, dynamic> json) {
  return _MeditationProgressModel.fromJson(json);
}

/// @nodoc
mixin _$MeditationProgressModel {
  @JsonKey(name: 'level_name')
  String get levelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_level_count')
  int get nextLevelCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_level_count')
  int get currentLevelCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeditationProgressModelCopyWith<MeditationProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeditationProgressModelCopyWith<$Res> {
  factory $MeditationProgressModelCopyWith(MeditationProgressModel value,
          $Res Function(MeditationProgressModel) then) =
      _$MeditationProgressModelCopyWithImpl<$Res, MeditationProgressModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'level_name') String levelName,
      @JsonKey(name: 'next_level_count') int nextLevelCount,
      @JsonKey(name: 'current_level_count') int currentLevelCount});
}

/// @nodoc
class _$MeditationProgressModelCopyWithImpl<$Res,
        $Val extends MeditationProgressModel>
    implements $MeditationProgressModelCopyWith<$Res> {
  _$MeditationProgressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelName = null,
    Object? nextLevelCount = null,
    Object? currentLevelCount = null,
  }) {
    return _then(_value.copyWith(
      levelName: null == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String,
      nextLevelCount: null == nextLevelCount
          ? _value.nextLevelCount
          : nextLevelCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevelCount: null == currentLevelCount
          ? _value.currentLevelCount
          : currentLevelCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeditationProgressModelImplCopyWith<$Res>
    implements $MeditationProgressModelCopyWith<$Res> {
  factory _$$MeditationProgressModelImplCopyWith(
          _$MeditationProgressModelImpl value,
          $Res Function(_$MeditationProgressModelImpl) then) =
      __$$MeditationProgressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'level_name') String levelName,
      @JsonKey(name: 'next_level_count') int nextLevelCount,
      @JsonKey(name: 'current_level_count') int currentLevelCount});
}

/// @nodoc
class __$$MeditationProgressModelImplCopyWithImpl<$Res>
    extends _$MeditationProgressModelCopyWithImpl<$Res,
        _$MeditationProgressModelImpl>
    implements _$$MeditationProgressModelImplCopyWith<$Res> {
  __$$MeditationProgressModelImplCopyWithImpl(
      _$MeditationProgressModelImpl _value,
      $Res Function(_$MeditationProgressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelName = null,
    Object? nextLevelCount = null,
    Object? currentLevelCount = null,
  }) {
    return _then(_$MeditationProgressModelImpl(
      levelName: null == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String,
      nextLevelCount: null == nextLevelCount
          ? _value.nextLevelCount
          : nextLevelCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevelCount: null == currentLevelCount
          ? _value.currentLevelCount
          : currentLevelCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeditationProgressModelImpl implements _MeditationProgressModel {
  const _$MeditationProgressModelImpl(
      {@JsonKey(name: 'level_name') required this.levelName,
      @JsonKey(name: 'next_level_count') required this.nextLevelCount,
      @JsonKey(name: 'current_level_count') required this.currentLevelCount});

  factory _$MeditationProgressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeditationProgressModelImplFromJson(json);

  @override
  @JsonKey(name: 'level_name')
  final String levelName;
  @override
  @JsonKey(name: 'next_level_count')
  final int nextLevelCount;
  @override
  @JsonKey(name: 'current_level_count')
  final int currentLevelCount;

  @override
  String toString() {
    return 'MeditationProgressModel(levelName: $levelName, nextLevelCount: $nextLevelCount, currentLevelCount: $currentLevelCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeditationProgressModelImpl &&
            (identical(other.levelName, levelName) ||
                other.levelName == levelName) &&
            (identical(other.nextLevelCount, nextLevelCount) ||
                other.nextLevelCount == nextLevelCount) &&
            (identical(other.currentLevelCount, currentLevelCount) ||
                other.currentLevelCount == currentLevelCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, levelName, nextLevelCount, currentLevelCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeditationProgressModelImplCopyWith<_$MeditationProgressModelImpl>
      get copyWith => __$$MeditationProgressModelImplCopyWithImpl<
          _$MeditationProgressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeditationProgressModelImplToJson(
      this,
    );
  }
}

abstract class _MeditationProgressModel implements MeditationProgressModel {
  const factory _MeditationProgressModel(
      {@JsonKey(name: 'level_name') required final String levelName,
      @JsonKey(name: 'next_level_count') required final int nextLevelCount,
      @JsonKey(name: 'current_level_count')
      required final int currentLevelCount}) = _$MeditationProgressModelImpl;

  factory _MeditationProgressModel.fromJson(Map<String, dynamic> json) =
      _$MeditationProgressModelImpl.fromJson;

  @override
  @JsonKey(name: 'level_name')
  String get levelName;
  @override
  @JsonKey(name: 'next_level_count')
  int get nextLevelCount;
  @override
  @JsonKey(name: 'current_level_count')
  int get currentLevelCount;
  @override
  @JsonKey(ignore: true)
  _$$MeditationProgressModelImplCopyWith<_$MeditationProgressModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
