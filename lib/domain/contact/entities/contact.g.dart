// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
  nickname: json['nickname'] as String,
  fullname: json['fullname'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  address: json['address'] as String,
  description: json['description'] as String,
  externals:
      (json['externals'] as List<dynamic>)
          .map((e) => ExternalLink.fromJson(e as Map<String, dynamic>))
          .toList(),
);
