import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/core/params.dart';
import '../../../domain/skills/entities/skill_section.dart';
import '../../../domain/skills/usecases/get_skills.dart';

part 'skills_section_event.dart';
part 'skills_section_state.dart';
part 'skills_section_bloc.freezed.dart';

class SkillsSectionBloc extends Bloc<SkillsSectionEvent, SkillsSectionState> {
  final GetSkills _getSkills;

  SkillsSectionBloc(this._getSkills)
    : super(const SkillsSectionState.initial()) {
    on<_Fetched>(_onFetched);
  }

  Future<void> _onFetched(
    _Fetched event,
    Emitter<SkillsSectionState> emit,
  ) async {
    emit(const SkillsSectionState.loading());

    final result = await _getSkills(const NoParams());

    emit(result.fold(SkillsSectionState.failure, SkillsSectionState.success));
  }
}
