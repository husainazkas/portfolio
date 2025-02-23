// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods',
);

TimelineData _$TimelineDataFromJson(Map<String, dynamic> json) {
  return _TimelineData.fromJson(json);
}

/// @nodoc
mixin _$TimelineData {
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineDataCopyWith<TimelineData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineDataCopyWith<$Res> {
  factory $TimelineDataCopyWith(
    TimelineData value,
    $Res Function(TimelineData) then,
  ) = _$TimelineDataCopyWithImpl<$Res, TimelineData>;
  @useResult
  $Res call({String title, String? subtitle, String? description});
}

/// @nodoc
class _$TimelineDataCopyWithImpl<$Res, $Val extends TimelineData>
    implements $TimelineDataCopyWith<$Res> {
  _$TimelineDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            subtitle:
                freezed == subtitle
                    ? _value.subtitle
                    : subtitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$_TimelineDataCopyWith<$Res>
    implements $TimelineDataCopyWith<$Res> {
  factory _$$_TimelineDataCopyWith(
    _$_TimelineData value,
    $Res Function(_$_TimelineData) then,
  ) = __$$_TimelineDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? subtitle, String? description});
}

/// @nodoc
class __$$_TimelineDataCopyWithImpl<$Res>
    extends _$TimelineDataCopyWithImpl<$Res, _$_TimelineData>
    implements _$$_TimelineDataCopyWith<$Res> {
  __$$_TimelineDataCopyWithImpl(
    _$_TimelineData _value,
    $Res Function(_$_TimelineData) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$_TimelineData(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        subtitle:
            freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_TimelineData implements _TimelineData {
  const _$_TimelineData({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  factory _$_TimelineData.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineDataFromJson(json);

  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String? description;

  @override
  String toString() {
    return 'TimelineData(title: $title, subtitle: $subtitle, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineDataCopyWith<_$_TimelineData> get copyWith =>
      __$$_TimelineDataCopyWithImpl<_$_TimelineData>(this, _$identity);
}

abstract class _TimelineData implements TimelineData {
  const factory _TimelineData({
    required final String title,
    required final String? subtitle,
    required final String? description,
  }) = _$_TimelineData;

  factory _TimelineData.fromJson(Map<String, dynamic> json) =
      _$_TimelineData.fromJson;

  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineDataCopyWith<_$_TimelineData> get copyWith =>
      throw _privateConstructorUsedError;
}
