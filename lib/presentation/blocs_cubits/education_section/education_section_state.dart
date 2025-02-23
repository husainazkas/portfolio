part of 'education_section_bloc.dart';

@freezed
class EducationSectionState with _$EducationSectionState {
  const factory EducationSectionState.initial() = _Initial;
  const factory EducationSectionState.loading() = _Loading;
  const factory EducationSectionState.failure(Failure failure) = _Failure;
  const factory EducationSectionState.success(List<TimelineData> data) =
      _Success;
}
