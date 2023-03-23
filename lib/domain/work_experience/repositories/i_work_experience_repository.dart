import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/work_experience.dart';

abstract class IWorkExperienceRepository {
  Future<Either<LocalFailure, List<WorkExperience>>> getWorkExperiences();
}
