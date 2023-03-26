import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/education.dart';

abstract class IEducationRepository {
  Future<Either<LocalFailure, List<Education>>> getEducations();
}
