// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'external_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExternalLink _$ExternalLinkFromJson(Map<String, dynamic> json) {
  return _ExternalLink.fromJson(json);
}

/// @nodoc
mixin _$ExternalLink {
  String get label => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExternalLinkCopyWith<ExternalLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalLinkCopyWith<$Res> {
  factory $ExternalLinkCopyWith(
          ExternalLink value, $Res Function(ExternalLink) then) =
      _$ExternalLinkCopyWithImpl<$Res, ExternalLink>;
  @useResult
  $Res call({String label, String? url, String type});
}

/// @nodoc
class _$ExternalLinkCopyWithImpl<$Res, $Val extends ExternalLink>
    implements $ExternalLinkCopyWith<$Res> {
  _$ExternalLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? url = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExternalLinkCopyWith<$Res>
    implements $ExternalLinkCopyWith<$Res> {
  factory _$$_ExternalLinkCopyWith(
          _$_ExternalLink value, $Res Function(_$_ExternalLink) then) =
      __$$_ExternalLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String? url, String type});
}

/// @nodoc
class __$$_ExternalLinkCopyWithImpl<$Res>
    extends _$ExternalLinkCopyWithImpl<$Res, _$_ExternalLink>
    implements _$$_ExternalLinkCopyWith<$Res> {
  __$$_ExternalLinkCopyWithImpl(
      _$_ExternalLink _value, $Res Function(_$_ExternalLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? url = freezed,
    Object? type = null,
  }) {
    return _then(_$_ExternalLink(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_ExternalLink implements _ExternalLink {
  const _$_ExternalLink(
      {required this.label, required this.url, required this.type});

  factory _$_ExternalLink.fromJson(Map<String, dynamic> json) =>
      _$$_ExternalLinkFromJson(json);

  @override
  final String label;
  @override
  final String? url;
  @override
  final String type;

  @override
  String toString() {
    return 'ExternalLink(label: $label, url: $url, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExternalLink &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, url, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExternalLinkCopyWith<_$_ExternalLink> get copyWith =>
      __$$_ExternalLinkCopyWithImpl<_$_ExternalLink>(this, _$identity);
}

abstract class _ExternalLink implements ExternalLink {
  const factory _ExternalLink(
      {required final String label,
      required final String? url,
      required final String type}) = _$_ExternalLink;

  factory _ExternalLink.fromJson(Map<String, dynamic> json) =
      _$_ExternalLink.fromJson;

  @override
  String get label;
  @override
  String? get url;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_ExternalLinkCopyWith<_$_ExternalLink> get copyWith =>
      throw _privateConstructorUsedError;
}
