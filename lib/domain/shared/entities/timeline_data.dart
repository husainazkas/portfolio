import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_data.freezed.dart';
part 'timeline_data.g.dart';

@Freezed(toJson: false)
class TimelineData with _$TimelineData {
  const factory TimelineData({
    required String title,
    required String? subtitle,
    required String? description,
  }) = _TimelineData;

  factory TimelineData.fromJson(Map<String, dynamic> json) =>
      _$TimelineDataFromJson(json);
}
