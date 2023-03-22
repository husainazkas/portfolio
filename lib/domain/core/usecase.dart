import 'package:dartz/dartz.dart';

import 'failures.dart';

abstract class UseCase<T, P, E extends Failure> {
  Future<Either<E, T>> call(P params);
}
