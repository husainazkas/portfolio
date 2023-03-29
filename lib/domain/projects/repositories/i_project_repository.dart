import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/project_group.dart';

abstract class IProjectRepository {
  Future<Either<LocalFailure, List<ProjectGroup>>> getProjects();
}
