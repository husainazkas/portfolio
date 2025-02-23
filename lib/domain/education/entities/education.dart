import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/entities/timeline_data.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@Freezed(toJson: false)
class Education with _$Education {
  const Education._();
  const factory Education({
    required String name,
    required String major,
    required String period,
    required String? description,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  TimelineData toTimelineData() => TimelineData(
    title: name,
    subtitle: '$major ($period)',
    description: description,
  );
}
