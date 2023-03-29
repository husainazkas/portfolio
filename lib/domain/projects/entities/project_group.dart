import 'package:freezed_annotation/freezed_annotation.dart';

import 'project.dart';

part 'project_group.freezed.dart';
part 'project_group.g.dart';

@Freezed(toJson: false)
class ProjectGroup with _$ProjectGroup {
  const factory ProjectGroup({
    required String header,
    @JsonKey(name: 'contents') required List<Project> projects,
  }) = _ProjectGroup;

  factory ProjectGroup.fromJson(Map<String, dynamic> json) =>
      _$ProjectGroupFromJson(json);
}
