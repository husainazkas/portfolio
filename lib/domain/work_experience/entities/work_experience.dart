import 'package:freezed_annotation/freezed_annotation.dart';

import 'timeline_experience.dart';

part 'work_experience.freezed.dart';
part 'work_experience.g.dart';

@Freezed(toJson: false)
class WorkExperience with _$WorkExperience {
  const factory WorkExperience({
    required String name,
    required String period,
    required String address,
    required String? thumb,
    @JsonKey(name: 'href') required String? url,
    required List<TimelineExperience> timeline,
    required List<String> tags,
  }) = _WorkExperience;

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);
}
