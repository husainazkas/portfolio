part of 'projects_section_bloc.dart';

@freezed
class ProjectsSectionState with _$ProjectsSectionState {
  const factory ProjectsSectionState.initial() = _Initial;
  const factory ProjectsSectionState.loading() = _Loading;
  const factory ProjectsSectionState.failure(Failure failure) = _Failure;
  const factory ProjectsSectionState.success(List<ProjectGroup> projects) = _Success;
}
