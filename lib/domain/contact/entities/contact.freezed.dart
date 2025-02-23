// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods',
);

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String get nickname => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<ExternalLink> get externals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call({
    String nickname,
    String fullname,
    String email,
    String phone,
    String address,
    String description,
    List<ExternalLink> externals,
  });
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? fullname = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? description = null,
    Object? externals = null,
  }) {
    return _then(
      _value.copyWith(
            nickname:
                null == nickname
                    ? _value.nickname
                    : nickname // ignore: cast_nullable_to_non_nullable
                        as String,
            fullname:
                null == fullname
                    ? _value.fullname
                    : fullname // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            phone:
                null == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            externals:
                null == externals
                    ? _value.externals
                    : externals // ignore: cast_nullable_to_non_nullable
                        as List<ExternalLink>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$_ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$_ContactCopyWith(
    _$_Contact value,
    $Res Function(_$_Contact) then,
  ) = __$$_ContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String nickname,
    String fullname,
    String email,
    String phone,
    String address,
    String description,
    List<ExternalLink> externals,
  });
}

/// @nodoc
class __$$_ContactCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$_Contact>
    implements _$$_ContactCopyWith<$Res> {
  __$$_ContactCopyWithImpl(_$_Contact _value, $Res Function(_$_Contact) _then)
    : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? fullname = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? description = null,
    Object? externals = null,
  }) {
    return _then(
      _$_Contact(
        nickname:
            null == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                    as String,
        fullname:
            null == fullname
                ? _value.fullname
                : fullname // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        phone:
            null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        externals:
            null == externals
                ? _value._externals
                : externals // ignore: cast_nullable_to_non_nullable
                    as List<ExternalLink>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_Contact implements _Contact {
  const _$_Contact({
    required this.nickname,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.address,
    required this.description,
    required final List<ExternalLink> externals,
  }) : _externals = externals;

  factory _$_Contact.fromJson(Map<String, dynamic> json) =>
      _$$_ContactFromJson(json);

  @override
  final String nickname;
  @override
  final String fullname;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String description;
  final List<ExternalLink> _externals;
  @override
  List<ExternalLink> get externals {
    if (_externals is EqualUnmodifiableListView) return _externals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_externals);
  }

  @override
  String toString() {
    return 'Contact(nickname: $nickname, fullname: $fullname, email: $email, phone: $phone, address: $address, description: $description, externals: $externals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contact &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._externals,
              _externals,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    nickname,
    fullname,
    email,
    phone,
    address,
    description,
    const DeepCollectionEquality().hash(_externals),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      __$$_ContactCopyWithImpl<_$_Contact>(this, _$identity);
}

abstract class _Contact implements Contact {
  const factory _Contact({
    required final String nickname,
    required final String fullname,
    required final String email,
    required final String phone,
    required final String address,
    required final String description,
    required final List<ExternalLink> externals,
  }) = _$_Contact;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$_Contact.fromJson;

  @override
  String get nickname;
  @override
  String get fullname;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  String get description;
  @override
  List<ExternalLink> get externals;
  @override
  @JsonKey(ignore: true)
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}
