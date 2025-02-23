import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/core/params.dart';
import '../../../domain/education/usecase/get_educations.dart';
import '../../../domain/shared/entities/timeline_data.dart';

part 'education_section_event.dart';
part 'education_section_state.dart';
part 'education_section_bloc.freezed.dart';

class EducationSectionBloc
    extends Bloc<EducationSectionEvent, EducationSectionState> {
  final GetEducations _getEducations;

  EducationSectionBloc(this._getEducations)
    : super(const EducationSectionState.initial()) {
    on<_Fetched>(_onFetched);
  }

  Future<void> _onFetched(
    _Fetched event,
    Emitter<EducationSectionState> emit,
  ) async {
    emit(const EducationSectionState.loading());

    final result = await _getEducations(const NoParams());

    emit(
      result.fold(EducationSectionState.failure, EducationSectionState.success),
    );
  }
}
