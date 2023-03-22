import 'package:dartz/dartz.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/projects/entities/project.dart';
import '../../../domain/projects/repositories/i_project_repository.dart';
import '../datasources/project_local_datasource.dart';

class ProjectRepository implements IProjectRepository {
  final IProjectLocalDatasource _localDatasource;

  const ProjectRepository(this._localDatasource);

  @override
  Future<Either<LocalFailure, List<Project>>> getProjects() async {
    try {
      final result = await _localDatasource.getProjects();

      return Right(result);
    } on Failure catch (e) {
      return Left(e as LocalFailure);
    }
  }
}
