part of 'skills_section_bloc.dart';

@freezed
class SkillsSectionState with _$SkillsSectionState {
  const factory SkillsSectionState.initial() = _Initial;
  const factory SkillsSectionState.loading() = _Loading;
  const factory SkillsSectionState.failure(Failure failure) = _Failure;
  const factory SkillsSectionState.success(SkillSection data) = _Success;
}
