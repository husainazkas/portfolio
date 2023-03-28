import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/contact.dart';

abstract class IContactRepository {
  Future<Either<LocalFailure, Contact>> getContact();
}
