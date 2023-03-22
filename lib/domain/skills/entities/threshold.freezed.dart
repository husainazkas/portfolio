// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threshold.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Threshold _$ThresholdFromJson(Map<String, dynamic> json) {
  return _Threshold.fromJson(json);
}

/// @nodoc
mixin _$Threshold {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThresholdCopyWith<Threshold> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThresholdCopyWith<$Res> {
  factory $ThresholdCopyWith(Threshold value, $Res Function(Threshold) then) =
      _$ThresholdCopyWithImpl<$Res, Threshold>;
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class _$ThresholdCopyWithImpl<$Res, $Val extends Threshold>
    implements $ThresholdCopyWith<$Res> {
  _$ThresholdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThresholdCopyWith<$Res> implements $ThresholdCopyWith<$Res> {
  factory _$$_ThresholdCopyWith(
          _$_Threshold value, $Res Function(_$_Threshold) then) =
      __$$_ThresholdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class __$$_ThresholdCopyWithImpl<$Res>
    extends _$ThresholdCopyWithImpl<$Res, _$_Threshold>
    implements _$$_ThresholdCopyWith<$Res> {
  __$$_ThresholdCopyWithImpl(
      _$_Threshold _value, $Res Function(_$_Threshold) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$_Threshold(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_Threshold implements _Threshold {
  const _$_Threshold({required this.label, required this.value});

  factory _$_Threshold.fromJson(Map<String, dynamic> json) =>
      _$$_ThresholdFromJson(json);

  @override
  final String label;
  @override
  final double value;

  @override
  String toString() {
    return 'Threshold(label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Threshold &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThresholdCopyWith<_$_Threshold> get copyWith =>
      __$$_ThresholdCopyWithImpl<_$_Threshold>(this, _$identity);
}

abstract class _Threshold implements Threshold {
  const factory _Threshold(
      {required final String label,
      required final double value}) = _$_Threshold;

  factory _Threshold.fromJson(Map<String, dynamic> json) =
      _$_Threshold.fromJson;

  @override
  String get label;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_ThresholdCopyWith<_$_Threshold> get copyWith =>
      throw _privateConstructorUsedError;
}
