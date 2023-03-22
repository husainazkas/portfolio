import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/params.dart';
import '../../core/usecase.dart';
import '../entities/skill_section.dart';
import '../repositories/i_skill_repository.dart';

class GetSkills implements UseCase<SkillSection, NoParams, LocalFailure> {
  final ISkillRepository _repository;

  const GetSkills(this._repository);

  @override
  Future<Either<LocalFailure, SkillSection>> call(NoParams params) =>
      _repository.getSkills();
}
