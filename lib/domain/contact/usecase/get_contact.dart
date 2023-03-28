import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/params.dart';
import '../../core/usecase.dart';
import '../entities/contact.dart';
import '../repositories/i_contact_repository.dart';

class GetContact implements UseCase<Contact, NoParams, LocalFailure> {
  final IContactRepository _repository;

  const GetContact(this._repository);

  @override
  Future<Either<LocalFailure, Contact>> call(NoParams params) =>
      _repository.getContact();
}
