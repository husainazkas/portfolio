part of 'contact_section_bloc.dart';

@freezed
class ContactSectionState with _$ContactSectionState {
  const factory ContactSectionState.initial() = _Initial;
  const factory ContactSectionState.loading() = _Loading;
  const factory ContactSectionState.failure(Failure failure) = _Failure;
  const factory ContactSectionState.success(Contact contact) = _Success;
}
