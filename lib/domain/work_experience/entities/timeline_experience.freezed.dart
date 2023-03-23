// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimelineExperience _$TimelineExperienceFromJson(Map<String, dynamic> json) {
  return _TimelineExperience.fromJson(json);
}

/// @nodoc
mixin _$TimelineExperience {
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineExperienceCopyWith<TimelineExperience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineExperienceCopyWith<$Res> {
  factory $TimelineExperienceCopyWith(
          TimelineExperience value, $Res Function(TimelineExperience) then) =
      _$TimelineExperienceCopyWithImpl<$Res, TimelineExperience>;
  @useResult
  $Res call({String title, String type, String period, String description});
}

/// @nodoc
class _$TimelineExperienceCopyWithImpl<$Res, $Val extends TimelineExperience>
    implements $TimelineExperienceCopyWith<$Res> {
  _$TimelineExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? period = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimelineExperienceCopyWith<$Res>
    implements $TimelineExperienceCopyWith<$Res> {
  factory _$$_TimelineExperienceCopyWith(_$_TimelineExperience value,
          $Res Function(_$_TimelineExperience) then) =
      __$$_TimelineExperienceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String type, String period, String description});
}

/// @nodoc
class __$$_TimelineExperienceCopyWithImpl<$Res>
    extends _$TimelineExperienceCopyWithImpl<$Res, _$_TimelineExperience>
    implements _$$_TimelineExperienceCopyWith<$Res> {
  __$$_TimelineExperienceCopyWithImpl(
      _$_TimelineExperience _value, $Res Function(_$_TimelineExperience) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? period = null,
    Object? description = null,
  }) {
    return _then(_$_TimelineExperience(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_TimelineExperience implements _TimelineExperience {
  const _$_TimelineExperience(
      {required this.title,
      required this.type,
      required this.period,
      required this.description});

  factory _$_TimelineExperience.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineExperienceFromJson(json);

  @override
  final String title;
  @override
  final String type;
  @override
  final String period;
  @override
  final String description;

  @override
  String toString() {
    return 'TimelineExperience(title: $title, type: $type, period: $period, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineExperience &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, type, period, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineExperienceCopyWith<_$_TimelineExperience> get copyWith =>
      __$$_TimelineExperienceCopyWithImpl<_$_TimelineExperience>(
          this, _$identity);
}

abstract class _TimelineExperience implements TimelineExperience {
  const factory _TimelineExperience(
      {required final String title,
      required final String type,
      required final String period,
      required final String description}) = _$_TimelineExperience;

  factory _TimelineExperience.fromJson(Map<String, dynamic> json) =
      _$_TimelineExperience.fromJson;

  @override
  String get title;
  @override
  String get type;
  @override
  String get period;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineExperienceCopyWith<_$_TimelineExperience> get copyWith =>
      throw _privateConstructorUsedError;
}
