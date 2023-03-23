import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/core/params.dart';
import '../../../domain/work_experience/entities/work_experience.dart';
import '../../../domain/work_experience/usecases/get_work_experiences.dart';

part 'work_experience_section_event.dart';
part 'work_experience_section_state.dart';
part 'work_experience_section_bloc.freezed.dart';

class WorkExperienceSectionBloc
    extends Bloc<WorkExperienceSectionEvent, WorkExperienceSectionState> {
  final GetWorkExperiences _getWorkExperiences;
  WorkExperienceSectionBloc(this._getWorkExperiences)
      : super(const WorkExperienceSectionState.initial()) {
    on<_Fetched>(_onFetched);
  }

  Future<void> _onFetched(
      _Fetched event, Emitter<WorkExperienceSectionState> emit) async {
    emit(const WorkExperienceSectionState.loading());

    final result = await _getWorkExperiences(const NoParams());

    print(result);

    emit(result.fold(
      WorkExperienceSectionState.failure,
      WorkExperienceSectionState.success,
    ));
  }
}
