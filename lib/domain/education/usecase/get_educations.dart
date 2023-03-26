import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/params.dart';
import '../../core/usecase.dart';
import '../../shared/entities/timeline_data.dart';
import '../repositories/i_education_repository.dart';

class GetEducations
    implements UseCase<List<TimelineData>, NoParams, LocalFailure> {
  final IEducationRepository _repository;

  const GetEducations(this._repository);

  @override
  Future<Either<LocalFailure, List<TimelineData>>> call(NoParams params) =>
      _repository.getEducations().then((v) => v.fold(
            left,
            (r) => right(r.map((e) => e.toTimelineData()).toList()),
          ));
}
