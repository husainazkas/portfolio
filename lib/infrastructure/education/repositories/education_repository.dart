import 'package:dartz/dartz.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/education/entities/education.dart';
import '../../../domain/education/repositories/i_education_repository.dart';
import '../datasources/education_local_datasource.dart';

class EducationRepository implements IEducationRepository {
  final IEducationLocalDatasource _localDatasource;

  const EducationRepository(this._localDatasource);

  @override
  Future<Either<LocalFailure, List<Education>>> getEducations() async {
    try {
      final result = await _localDatasource.getEducations();
      return Right(result);
    } on Failure catch (e) {
      return Left(e as LocalFailure);
    }
  }
}
