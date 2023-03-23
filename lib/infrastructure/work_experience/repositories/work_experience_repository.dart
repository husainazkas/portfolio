import 'package:dartz/dartz.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/work_experience/entities/work_experience.dart';
import '../../../domain/work_experience/repositories/i_work_experience_repository.dart';
import '../datasources/work_experience_local_datasource.dart';

class WorkExperienceRepository implements IWorkExperienceRepository {
  final IWorkExperienceLocalDatasource _localDatasource;

  const WorkExperienceRepository(this._localDatasource);

  @override
  Future<Either<LocalFailure, List<WorkExperience>>>
      getWorkExperiences() async {
    try {
      final result = await _localDatasource.getWorkExperiences();

      return Right(result);
    } on Failure catch (e) {
      return Left(e as LocalFailure);
    }
  }
}
