import 'package:freezed_annotation/freezed_annotation.dart';

part 'threshold.freezed.dart';
part 'threshold.g.dart';

@Freezed(toJson: false)
class Threshold with _$Threshold {
  const factory Threshold({required String label, required double value}) =
      _Threshold;

  factory Threshold.fromJson(Map<String, dynamic> json) =>
      _$ThresholdFromJson(json);
}
