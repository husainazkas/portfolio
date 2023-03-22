import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/params.dart';
import '../../core/usecase.dart';
import '../entities/project.dart';
import '../repositories/i_project_repository.dart';

class GetProjects implements UseCase<List<Project>, NoParams, LocalFailure> {
  final IProjectRepository _repository;

  const GetProjects(this._repository);

  @override
  Future<Either<LocalFailure, List<Project>>> call(NoParams params) =>
      _repository.getProjects();
}
