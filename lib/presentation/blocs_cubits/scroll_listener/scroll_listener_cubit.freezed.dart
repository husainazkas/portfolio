// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scroll_listener_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods',
);

/// @nodoc
mixin _$ScrollListenerState {
  double get offset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScrollListenerStateCopyWith<ScrollListenerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollListenerStateCopyWith<$Res> {
  factory $ScrollListenerStateCopyWith(
    ScrollListenerState value,
    $Res Function(ScrollListenerState) then,
  ) = _$ScrollListenerStateCopyWithImpl<$Res, ScrollListenerState>;
  @useResult
  $Res call({double offset});
}

/// @nodoc
class _$ScrollListenerStateCopyWithImpl<$Res, $Val extends ScrollListenerState>
    implements $ScrollListenerStateCopyWith<$Res> {
  _$ScrollListenerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? offset = null}) {
    return _then(
      _value.copyWith(
            offset:
                null == offset
                    ? _value.offset
                    : offset // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$_ScrollListenerStateCopyWith<$Res>
    implements $ScrollListenerStateCopyWith<$Res> {
  factory _$$_ScrollListenerStateCopyWith(
    _$_ScrollListenerState value,
    $Res Function(_$_ScrollListenerState) then,
  ) = __$$_ScrollListenerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double offset});
}

/// @nodoc
class __$$_ScrollListenerStateCopyWithImpl<$Res>
    extends _$ScrollListenerStateCopyWithImpl<$Res, _$_ScrollListenerState>
    implements _$$_ScrollListenerStateCopyWith<$Res> {
  __$$_ScrollListenerStateCopyWithImpl(
    _$_ScrollListenerState _value,
    $Res Function(_$_ScrollListenerState) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? offset = null}) {
    return _then(
      _$_ScrollListenerState(
        null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                as double,
      ),
    );
  }
}

/// @nodoc

class _$_ScrollListenerState implements _ScrollListenerState {
  const _$_ScrollListenerState([this.offset = 0.0]);

  @override
  @JsonKey()
  final double offset;

  @override
  String toString() {
    return 'ScrollListenerState(offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollListenerState &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollListenerStateCopyWith<_$_ScrollListenerState> get copyWith =>
      __$$_ScrollListenerStateCopyWithImpl<_$_ScrollListenerState>(
        this,
        _$identity,
      );
}

abstract class _ScrollListenerState implements ScrollListenerState {
  const factory _ScrollListenerState([final double offset]) =
      _$_ScrollListenerState;

  @override
  double get offset;
  @override
  @JsonKey(ignore: true)
  _$$_ScrollListenerStateCopyWith<_$_ScrollListenerState> get copyWith =>
      throw _privateConstructorUsedError;
}
