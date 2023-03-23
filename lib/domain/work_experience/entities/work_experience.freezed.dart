// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkExperience _$WorkExperienceFromJson(Map<String, dynamic> json) {
  return _WorkExperience.fromJson(json);
}

/// @nodoc
mixin _$WorkExperience {
  String get name => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get thumb => throw _privateConstructorUsedError;
  @JsonKey(name: 'href')
  String? get url => throw _privateConstructorUsedError;
  List<TimelineExperience> get timeline => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkExperienceCopyWith<WorkExperience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkExperienceCopyWith<$Res> {
  factory $WorkExperienceCopyWith(
          WorkExperience value, $Res Function(WorkExperience) then) =
      _$WorkExperienceCopyWithImpl<$Res, WorkExperience>;
  @useResult
  $Res call(
      {String name,
      String period,
      String address,
      String? thumb,
      @JsonKey(name: 'href') String? url,
      List<TimelineExperience> timeline});
}

/// @nodoc
class _$WorkExperienceCopyWithImpl<$Res, $Val extends WorkExperience>
    implements $WorkExperienceCopyWith<$Res> {
  _$WorkExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? period = null,
    Object? address = null,
    Object? thumb = freezed,
    Object? url = freezed,
    Object? timeline = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<TimelineExperience>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkExperienceCopyWith<$Res>
    implements $WorkExperienceCopyWith<$Res> {
  factory _$$_WorkExperienceCopyWith(
          _$_WorkExperience value, $Res Function(_$_WorkExperience) then) =
      __$$_WorkExperienceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String period,
      String address,
      String? thumb,
      @JsonKey(name: 'href') String? url,
      List<TimelineExperience> timeline});
}

/// @nodoc
class __$$_WorkExperienceCopyWithImpl<$Res>
    extends _$WorkExperienceCopyWithImpl<$Res, _$_WorkExperience>
    implements _$$_WorkExperienceCopyWith<$Res> {
  __$$_WorkExperienceCopyWithImpl(
      _$_WorkExperience _value, $Res Function(_$_WorkExperience) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? period = null,
    Object? address = null,
    Object? thumb = freezed,
    Object? url = freezed,
    Object? timeline = null,
  }) {
    return _then(_$_WorkExperience(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      timeline: null == timeline
          ? _value._timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<TimelineExperience>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_WorkExperience implements _WorkExperience {
  const _$_WorkExperience(
      {required this.name,
      required this.period,
      required this.address,
      required this.thumb,
      @JsonKey(name: 'href') required this.url,
      required final List<TimelineExperience> timeline})
      : _timeline = timeline;

  factory _$_WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$$_WorkExperienceFromJson(json);

  @override
  final String name;
  @override
  final String period;
  @override
  final String address;
  @override
  final String? thumb;
  @override
  @JsonKey(name: 'href')
  final String? url;
  final List<TimelineExperience> _timeline;
  @override
  List<TimelineExperience> get timeline {
    if (_timeline is EqualUnmodifiableListView) return _timeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeline);
  }

  @override
  String toString() {
    return 'WorkExperience(name: $name, period: $period, address: $address, thumb: $thumb, url: $url, timeline: $timeline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkExperience &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.thumb, thumb) || other.thumb == thumb) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._timeline, _timeline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, period, address, thumb,
      url, const DeepCollectionEquality().hash(_timeline));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkExperienceCopyWith<_$_WorkExperience> get copyWith =>
      __$$_WorkExperienceCopyWithImpl<_$_WorkExperience>(this, _$identity);
}

abstract class _WorkExperience implements WorkExperience {
  const factory _WorkExperience(
      {required final String name,
      required final String period,
      required final String address,
      required final String? thumb,
      @JsonKey(name: 'href') required final String? url,
      required final List<TimelineExperience> timeline}) = _$_WorkExperience;

  factory _WorkExperience.fromJson(Map<String, dynamic> json) =
      _$_WorkExperience.fromJson;

  @override
  String get name;
  @override
  String get period;
  @override
  String get address;
  @override
  String? get thumb;
  @override
  @JsonKey(name: 'href')
  String? get url;
  @override
  List<TimelineExperience> get timeline;
  @override
  @JsonKey(ignore: true)
  _$$_WorkExperienceCopyWith<_$_WorkExperience> get copyWith =>
      throw _privateConstructorUsedError;
}
