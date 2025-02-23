// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods',
);

SkillSection _$SkillSectionFromJson(Map<String, dynamic> json) {
  return _SkillSection.fromJson(json);
}

/// @nodoc
mixin _$SkillSection {
  List<Threshold> get thresholds => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<Skill> get skills => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SkillSectionCopyWith<SkillSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillSectionCopyWith<$Res> {
  factory $SkillSectionCopyWith(
    SkillSection value,
    $Res Function(SkillSection) then,
  ) = _$SkillSectionCopyWithImpl<$Res, SkillSection>;
  @useResult
  $Res call({
    List<Threshold> thresholds,
    @JsonKey(name: 'data') List<Skill> skills,
  });
}

/// @nodoc
class _$SkillSectionCopyWithImpl<$Res, $Val extends SkillSection>
    implements $SkillSectionCopyWith<$Res> {
  _$SkillSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? thresholds = null, Object? skills = null}) {
    return _then(
      _value.copyWith(
            thresholds:
                null == thresholds
                    ? _value.thresholds
                    : thresholds // ignore: cast_nullable_to_non_nullable
                        as List<Threshold>,
            skills:
                null == skills
                    ? _value.skills
                    : skills // ignore: cast_nullable_to_non_nullable
                        as List<Skill>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$_SkillSectionCopyWith<$Res>
    implements $SkillSectionCopyWith<$Res> {
  factory _$$_SkillSectionCopyWith(
    _$_SkillSection value,
    $Res Function(_$_SkillSection) then,
  ) = __$$_SkillSectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Threshold> thresholds,
    @JsonKey(name: 'data') List<Skill> skills,
  });
}

/// @nodoc
class __$$_SkillSectionCopyWithImpl<$Res>
    extends _$SkillSectionCopyWithImpl<$Res, _$_SkillSection>
    implements _$$_SkillSectionCopyWith<$Res> {
  __$$_SkillSectionCopyWithImpl(
    _$_SkillSection _value,
    $Res Function(_$_SkillSection) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? thresholds = null, Object? skills = null}) {
    return _then(
      _$_SkillSection(
        thresholds:
            null == thresholds
                ? _value._thresholds
                : thresholds // ignore: cast_nullable_to_non_nullable
                    as List<Threshold>,
        skills:
            null == skills
                ? _value._skills
                : skills // ignore: cast_nullable_to_non_nullable
                    as List<Skill>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_SkillSection implements _SkillSection {
  const _$_SkillSection({
    required final List<Threshold> thresholds,
    @JsonKey(name: 'data') required final List<Skill> skills,
  }) : _thresholds = thresholds,
       _skills = skills;

  factory _$_SkillSection.fromJson(Map<String, dynamic> json) =>
      _$$_SkillSectionFromJson(json);

  final List<Threshold> _thresholds;
  @override
  List<Threshold> get thresholds {
    if (_thresholds is EqualUnmodifiableListView) return _thresholds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thresholds);
  }

  final List<Skill> _skills;
  @override
  @JsonKey(name: 'data')
  List<Skill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'SkillSection(thresholds: $thresholds, skills: $skills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkillSection &&
            const DeepCollectionEquality().equals(
              other._thresholds,
              _thresholds,
            ) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_thresholds),
    const DeepCollectionEquality().hash(_skills),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkillSectionCopyWith<_$_SkillSection> get copyWith =>
      __$$_SkillSectionCopyWithImpl<_$_SkillSection>(this, _$identity);
}

abstract class _SkillSection implements SkillSection {
  const factory _SkillSection({
    required final List<Threshold> thresholds,
    @JsonKey(name: 'data') required final List<Skill> skills,
  }) = _$_SkillSection;

  factory _SkillSection.fromJson(Map<String, dynamic> json) =
      _$_SkillSection.fromJson;

  @override
  List<Threshold> get thresholds;
  @override
  @JsonKey(name: 'data')
  List<Skill> get skills;
  @override
  @JsonKey(ignore: true)
  _$$_SkillSectionCopyWith<_$_SkillSection> get copyWith =>
      throw _privateConstructorUsedError;
}
