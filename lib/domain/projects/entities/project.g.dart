// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      thumb: json['image_url'] as String?,
      title: json['title'] as String,
      description: json['body'] as String,
      url: json['href'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );
