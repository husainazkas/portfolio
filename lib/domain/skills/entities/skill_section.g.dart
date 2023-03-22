// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkillSection _$$_SkillSectionFromJson(Map<String, dynamic> json) =>
    _$_SkillSection(
      thresholds: (json['thresholds'] as List<dynamic>)
          .map((e) => Threshold.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['data'] as List<dynamic>)
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
