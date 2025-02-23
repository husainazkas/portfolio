// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectGroup _$$_ProjectGroupFromJson(Map<String, dynamic> json) =>
    _$_ProjectGroup(
      header: json['header'] as String,
      projects:
          (json['contents'] as List<dynamic>)
              .map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
