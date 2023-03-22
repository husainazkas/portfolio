import 'package:freezed_annotation/freezed_annotation.dart';

import 'skill.dart';
import 'threshold.dart';

part 'skill_section.freezed.dart';
part 'skill_section.g.dart';

@Freezed(toJson: false)
class SkillSection with _$SkillSection {
  const factory SkillSection({
    required List<Threshold> thresholds,
    @JsonKey(name: 'data') required List<Skill> skills,
  }) = _SkillSection;

  factory SkillSection.fromJson(Map<String, dynamic> json) =>
      _$SkillSectionFromJson(json);
}
