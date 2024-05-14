// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuggestionResultModel _$SuggestionResultModelFromJson(
    Map<String, dynamic> json) {
  return _SuggestionResultModel.fromJson(json);
}

/// @nodoc
mixin _$SuggestionResultModel {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'suggested_meditations')
  List<SuggestedMeditationModel> get suggestedMeditations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionResultModelCopyWith<SuggestionResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionResultModelCopyWith<$Res> {
  factory $SuggestionResultModelCopyWith(SuggestionResultModel value,
          $Res Function(SuggestionResultModel) then) =
      _$SuggestionResultModelCopyWithImpl<$Res, SuggestionResultModel>;
  @useResult
  $Res call(
      {String message,
      @JsonKey(name: 'suggested_meditations')
      List<SuggestedMeditationModel> suggestedMeditations});
}

/// @nodoc
class _$SuggestionResultModelCopyWithImpl<$Res,
        $Val extends SuggestionResultModel>
    implements $SuggestionResultModelCopyWith<$Res> {
  _$SuggestionResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestedMeditations = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedMeditations: null == suggestedMeditations
          ? _value.suggestedMeditations
          : suggestedMeditations // ignore: cast_nullable_to_non_nullable
              as List<SuggestedMeditationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionResultModelImplCopyWith<$Res>
    implements $SuggestionResultModelCopyWith<$Res> {
  factory _$$SuggestionResultModelImplCopyWith(
          _$SuggestionResultModelImpl value,
          $Res Function(_$SuggestionResultModelImpl) then) =
      __$$SuggestionResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      @JsonKey(name: 'suggested_meditations')
      List<SuggestedMeditationModel> suggestedMeditations});
}

/// @nodoc
class __$$SuggestionResultModelImplCopyWithImpl<$Res>
    extends _$SuggestionResultModelCopyWithImpl<$Res,
        _$SuggestionResultModelImpl>
    implements _$$SuggestionResultModelImplCopyWith<$Res> {
  __$$SuggestionResultModelImplCopyWithImpl(_$SuggestionResultModelImpl _value,
      $Res Function(_$SuggestionResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestedMeditations = null,
  }) {
    return _then(_$SuggestionResultModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedMeditations: null == suggestedMeditations
          ? _value._suggestedMeditations
          : suggestedMeditations // ignore: cast_nullable_to_non_nullable
              as List<SuggestedMeditationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionResultModelImpl implements _SuggestionResultModel {
  const _$SuggestionResultModelImpl(
      {required this.message,
      @JsonKey(name: 'suggested_meditations')
      required final List<SuggestedMeditationModel> suggestedMeditations})
      : _suggestedMeditations = suggestedMeditations;

  factory _$SuggestionResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionResultModelImplFromJson(json);

  @override
  final String message;
  final List<SuggestedMeditationModel> _suggestedMeditations;
  @override
  @JsonKey(name: 'suggested_meditations')
  List<SuggestedMeditationModel> get suggestedMeditations {
    if (_suggestedMeditations is EqualUnmodifiableListView)
      return _suggestedMeditations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedMeditations);
  }

  @override
  String toString() {
    return 'SuggestionResultModel(message: $message, suggestedMeditations: $suggestedMeditations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionResultModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._suggestedMeditations, _suggestedMeditations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_suggestedMeditations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionResultModelImplCopyWith<_$SuggestionResultModelImpl>
      get copyWith => __$$SuggestionResultModelImplCopyWithImpl<
          _$SuggestionResultModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionResultModelImplToJson(
      this,
    );
  }
}

abstract class _SuggestionResultModel implements SuggestionResultModel {
  const factory _SuggestionResultModel(
          {required final String message,
          @JsonKey(name: 'suggested_meditations')
          required final List<SuggestedMeditationModel> suggestedMeditations}) =
      _$SuggestionResultModelImpl;

  factory _SuggestionResultModel.fromJson(Map<String, dynamic> json) =
      _$SuggestionResultModelImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: 'suggested_meditations')
  List<SuggestedMeditationModel> get suggestedMeditations;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionResultModelImplCopyWith<_$SuggestionResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SuggestedMeditationModel _$SuggestedMeditationModelFromJson(
    Map<String, dynamic> json) {
  return _SuggestedMeditationModel.fromJson(json);
}

/// @nodoc
mixin _$SuggestedMeditationModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestedMeditationModelCopyWith<SuggestedMeditationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedMeditationModelCopyWith<$Res> {
  factory $SuggestedMeditationModelCopyWith(SuggestedMeditationModel value,
          $Res Function(SuggestedMeditationModel) then) =
      _$SuggestedMeditationModelCopyWithImpl<$Res, SuggestedMeditationModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$SuggestedMeditationModelCopyWithImpl<$Res,
        $Val extends SuggestedMeditationModel>
    implements $SuggestedMeditationModelCopyWith<$Res> {
  _$SuggestedMeditationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestedMeditationModelImplCopyWith<$Res>
    implements $SuggestedMeditationModelCopyWith<$Res> {
  factory _$$SuggestedMeditationModelImplCopyWith(
          _$SuggestedMeditationModelImpl value,
          $Res Function(_$SuggestedMeditationModelImpl) then) =
      __$$SuggestedMeditationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$SuggestedMeditationModelImplCopyWithImpl<$Res>
    extends _$SuggestedMeditationModelCopyWithImpl<$Res,
        _$SuggestedMeditationModelImpl>
    implements _$$SuggestedMeditationModelImplCopyWith<$Res> {
  __$$SuggestedMeditationModelImplCopyWithImpl(
      _$SuggestedMeditationModelImpl _value,
      $Res Function(_$SuggestedMeditationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$SuggestedMeditationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestedMeditationModelImpl implements _SuggestedMeditationModel {
  const _$SuggestedMeditationModelImpl({required this.id, required this.name});

  factory _$SuggestedMeditationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestedMeditationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'SuggestedMeditationModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedMeditationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedMeditationModelImplCopyWith<_$SuggestedMeditationModelImpl>
      get copyWith => __$$SuggestedMeditationModelImplCopyWithImpl<
          _$SuggestedMeditationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestedMeditationModelImplToJson(
      this,
    );
  }
}

abstract class _SuggestedMeditationModel implements SuggestedMeditationModel {
  const factory _SuggestedMeditationModel(
      {required final int id,
      required final String name}) = _$SuggestedMeditationModelImpl;

  factory _SuggestedMeditationModel.fromJson(Map<String, dynamic> json) =
      _$SuggestedMeditationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SuggestedMeditationModelImplCopyWith<_$SuggestedMeditationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
