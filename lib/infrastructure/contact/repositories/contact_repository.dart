import 'package:dartz/dartz.dart';

import '../../../domain/contact/entities/contact.dart';
import '../../../domain/contact/repositories/i_contact_repository.dart';
import '../../../domain/core/failures.dart';
import '../datasources/contact_local_datasource.dart';

class ContactRepository implements IContactRepository {
  final IContactLocalDatasource _localDatasource;

  const ContactRepository(this._localDatasource);

  @override
  Future<Either<LocalFailure, Contact>> getContact() async {
    try {
      final result = await _localDatasource.getContact();

      return Right(result);
    } on Failure catch (e) {
      return Left(e as LocalFailure);
    }
  }
}
