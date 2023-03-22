import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/project.dart';

abstract class IProjectRepository {
  Future<Either<LocalFailure, List<Project>>> getProjects();
}
