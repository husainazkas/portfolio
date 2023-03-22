import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/skill_section.dart';

abstract class ISkillRepository {
  Future<Either<LocalFailure, SkillSection>> getSkills();
}
