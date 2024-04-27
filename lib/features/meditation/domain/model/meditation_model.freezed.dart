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

MeditationModel _$MeditationModelFromJson(Map<String, dynamic> json) {
  return _MeditationModel.fromJson(json);
}

/// @nodoc
mixin _$MeditationModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  String get mediaFile => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      {int id,
      String title,
      String author,
      String description,
      String category,
      String cover,
      String mediaFile,
      List<String> tags});
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
    Object? author = null,
    Object? description = null,
    Object? category = null,
    Object? cover = null,
    Object? mediaFile = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      mediaFile: null == mediaFile
          ? _value.mediaFile
          : mediaFile // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
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
      {int id,
      String title,
      String author,
      String description,
      String category,
      String cover,
      String mediaFile,
      List<String> tags});
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
    Object? author = null,
    Object? description = null,
    Object? category = null,
    Object? cover = null,
    Object? mediaFile = null,
    Object? tags = null,
  }) {
    return _then(_$MeditationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      mediaFile: null == mediaFile
          ? _value.mediaFile
          : mediaFile // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeditationModelImpl implements _MeditationModel {
  _$MeditationModelImpl(
      {required this.id,
      required this.title,
      required this.author,
      required this.description,
      required this.category,
      required this.cover,
      required this.mediaFile,
      required final List<String> tags})
      : _tags = tags;

  factory _$MeditationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeditationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String author;
  @override
  final String description;
  @override
  final String category;
  @override
  final String cover;
  @override
  final String mediaFile;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'MeditationModel(id: $id, title: $title, author: $author, description: $description, category: $category, cover: $cover, mediaFile: $mediaFile, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeditationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.mediaFile, mediaFile) ||
                other.mediaFile == mediaFile) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, author, description,
      category, cover, mediaFile, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeditationModelImplCopyWith<_$MeditationModelImpl> get copyWith =>
      __$$MeditationModelImplCopyWithImpl<_$MeditationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeditationModelImplToJson(
      this,
    );
  }
}

abstract class _MeditationModel implements MeditationModel {
  factory _MeditationModel(
      {required final int id,
      required final String title,
      required final String author,
      required final String description,
      required final String category,
      required final String cover,
      required final String mediaFile,
      required final List<String> tags}) = _$MeditationModelImpl;

  factory _MeditationModel.fromJson(Map<String, dynamic> json) =
      _$MeditationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get author;
  @override
  String get description;
  @override
  String get category;
  @override
  String get cover;
  @override
  String get mediaFile;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$MeditationModelImplCopyWith<_$MeditationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
