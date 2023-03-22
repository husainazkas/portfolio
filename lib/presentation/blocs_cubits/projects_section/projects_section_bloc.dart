import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/core/params.dart';
import '../../../domain/projects/entities/project.dart';
import '../../../domain/projects/usecases/get_projects.dart';

part 'projects_section_event.dart';
part 'projects_section_state.dart';
part 'projects_section_bloc.freezed.dart';

class ProjectsSectionBloc
    extends Bloc<ProjectsSectionEvent, ProjectsSectionState> {
  final GetProjects _getProjects;

  ProjectsSectionBloc(this._getProjects)
      : super(const ProjectsSectionState.initial()) {
    on<_Fetched>(_onFetched);
  }

  Future<void> _onFetched(
      _Fetched event, Emitter<ProjectsSectionState> emit) async {
    emit(const ProjectsSectionState.loading());

    final result = await _getProjects(const NoParams());

    emit(result.fold(
      ProjectsSectionState.failure,
      ProjectsSectionState.success,
    ));
  }
}
