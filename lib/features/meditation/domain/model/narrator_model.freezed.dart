// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'narrator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NarratorModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NarratorModelCopyWith<NarratorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NarratorModelCopyWith<$Res> {
  factory $NarratorModelCopyWith(
          NarratorModel value, $Res Function(NarratorModel) then) =
      _$NarratorModelCopyWithImpl<$Res, NarratorModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$NarratorModelCopyWithImpl<$Res, $Val extends NarratorModel>
    implements $NarratorModelCopyWith<$Res> {
  _$NarratorModelCopyWithImpl(this._value, this._then);

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
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NarratorModelImplCopyWith<$Res>
    implements $NarratorModelCopyWith<$Res> {
  factory _$$NarratorModelImplCopyWith(
          _$NarratorModelImpl value, $Res Function(_$NarratorModelImpl) then) =
      __$$NarratorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$NarratorModelImplCopyWithImpl<$Res>
    extends _$NarratorModelCopyWithImpl<$Res, _$NarratorModelImpl>
    implements _$$NarratorModelImplCopyWith<$Res> {
  __$$NarratorModelImplCopyWithImpl(
      _$NarratorModelImpl _value, $Res Function(_$NarratorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$NarratorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NarratorModelImpl implements _NarratorModel {
  const _$NarratorModelImpl({required this.id, required this.name});

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'NarratorModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NarratorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NarratorModelImplCopyWith<_$NarratorModelImpl> get copyWith =>
      __$$NarratorModelImplCopyWithImpl<_$NarratorModelImpl>(this, _$identity);
}

abstract class _NarratorModel implements NarratorModel {
  const factory _NarratorModel(
      {required final String id,
      required final String name}) = _$NarratorModelImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$NarratorModelImplCopyWith<_$NarratorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
