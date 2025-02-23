import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/contact/entities/contact.dart';
import '../../../domain/contact/usecase/get_contact.dart';
import '../../../domain/core/failures.dart';
import '../../../domain/core/params.dart';

part 'contact_section_event.dart';
part 'contact_section_state.dart';
part 'contact_section_bloc.freezed.dart';

class ContactSectionBloc
    extends Bloc<ContactSectionEvent, ContactSectionState> {
  final GetContact _getContact;

  ContactSectionBloc(this._getContact)
    : super(const ContactSectionState.initial()) {
    on<_Fetched>(_onFetched);
  }

  Future<void> _onFetched(
    _Fetched event,
    Emitter<ContactSectionState> emit,
  ) async {
    emit(const ContactSectionState.loading());

    final result = await _getContact(const NoParams());

    emit(result.fold(ContactSectionState.failure, ContactSectionState.success));
  }
}
