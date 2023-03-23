import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_experience.freezed.dart';
part 'timeline_experience.g.dart';

@Freezed(toJson: false)
class TimelineExperience with _$TimelineExperience {
  const factory TimelineExperience({
    required String title,
    required String type,
    required String period,
    required String description,
  }) = _TimelineExperience;

  factory TimelineExperience.fromJson(Map<String, dynamic> json) =>
      _$TimelineExperienceFromJson(json);
}
