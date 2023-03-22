import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@Freezed(toJson: false)
class Project with _$Project {
  const factory Project({
    @JsonKey(name: 'image_url') required String? thumb,
    required String title,
    @JsonKey(name: 'body') required String description,
    @JsonKey(name: 'href') required String? url,
    required List<String> tags,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
