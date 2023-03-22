import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required String? thumb,
    required String description,
    required String? url,
    required List<String> tags,
  }) = _Project;
}
