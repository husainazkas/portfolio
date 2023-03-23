// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkExperience _$$_WorkExperienceFromJson(Map<String, dynamic> json) =>
    _$_WorkExperience(
      name: json['name'] as String,
      period: json['period'] as String,
      address: json['address'] as String,
      thumb: json['thumb'] as String?,
      url: json['href'] as String?,
      timeline: (json['timeline'] as List<dynamic>)
          .map((e) => TimelineExperience.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );
