import 'package:dartz/dartz.dart';

import '../../../domain/core/failures.dart';
import '../../../domain/skills/entities/skill_section.dart';
import '../../../domain/skills/repositories/i_skill_repository.dart';
import '../datasources/skill_local_datasource.dart';

class SkillRepository implements ISkillRepository {
  final ISkillLocalDatasource _localDatasource;

  const SkillRepository(this._localDatasource);

  @override
  Future<Either<LocalFailure, SkillSection>> getSkills() async {
    try {
      final result = await _localDatasource.getSkills();
      return Right(result);
    } on Failure catch (e) {
      return Left(e as LocalFailure);
    }
  }
}
