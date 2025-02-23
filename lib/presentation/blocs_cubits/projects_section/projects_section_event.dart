part of 'projects_section_bloc.dart';

@freezed
class ProjectsSectionEvent with _$ProjectsSectionEvent {
  const factory ProjectsSectionEvent.fetched() = _Fetched;
}
