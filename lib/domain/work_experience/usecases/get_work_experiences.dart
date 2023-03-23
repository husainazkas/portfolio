import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/params.dart';
import '../../core/usecase.dart';
import '../entities/work_experience.dart';
import '../repositories/i_work_experience_repository.dart';

class GetWorkExperiences
    implements UseCase<List<WorkExperience>, NoParams, LocalFailure> {
  final IWorkExperienceRepository _repository;

  const GetWorkExperiences(this._repository);

  @override
  Future<Either<LocalFailure, List<WorkExperience>>> call(NoParams params) =>
      _repository.getWorkExperiences();
}
