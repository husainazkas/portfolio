import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/params.dart';
import '../../core/usecase.dart';
import '../entities/project_group.dart';
import '../repositories/i_project_repository.dart';

class GetProjects
    implements UseCase<List<ProjectGroup>, NoParams, LocalFailure> {
  final IProjectRepository _repository;

  const GetProjects(this._repository);

  @override
  Future<Either<LocalFailure, List<ProjectGroup>>> call(NoParams params) =>
      _repository.getProjects();
}
