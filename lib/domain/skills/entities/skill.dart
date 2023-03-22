import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.freezed.dart';
part 'skill.g.dart';

@Freezed(toJson: false)
class Skill with _$Skill {
  const factory Skill({required String title, required double score}) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}
