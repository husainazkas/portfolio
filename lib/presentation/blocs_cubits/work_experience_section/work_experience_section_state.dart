part of 'work_experience_section_bloc.dart';

@freezed
class WorkExperienceSectionState with _$WorkExperienceSectionState {
  const factory WorkExperienceSectionState.initial() = _Initial;
  const factory WorkExperienceSectionState.loading() = _Loading;
  const factory WorkExperienceSectionState.failure(Failure failure) = _Failure;
  const factory WorkExperienceSectionState.success(
    List<WorkExperience> experiences,
  ) = _Success;
}
