import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/entities/timeline_data.dart';
import 'work_timeline.dart';

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
    @JsonKey(fromJson: WorkExperience._parseTimeline)
    required List<TimelineData> timeline,
    required List<String> tags,
  }) = _WorkExperience;

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);

  static List<TimelineData> _parseTimeline(List timeline) {
    return timeline
        .map((e) => WorkTimeline.fromJson((e as Map).cast()).toTimelineData())
        .toList();
  }
}
