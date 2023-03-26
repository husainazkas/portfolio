import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/entities/timeline_data.dart';

part 'work_timeline.freezed.dart';
part 'work_timeline.g.dart';

@Freezed(toJson: false)
class WorkTimeline with _$WorkTimeline {
  const WorkTimeline._();
  const factory WorkTimeline({
    required String title,
    required String type,
    required String period,
    required String description,
  }) = _WorkTimeline;

  factory WorkTimeline.fromJson(Map<String, dynamic> json) =>
      _$WorkTimelineFromJson(json);

  TimelineData toTimelineData() => TimelineData(
        title: title,
        subtitle: '$period ($type)',
        description: description,
      );
}
