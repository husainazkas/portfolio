import 'package:freezed_annotation/freezed_annotation.dart';

import 'external_link.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@Freezed(toJson: false)
class Contact with _$Contact {
  const factory Contact({
    required String nickname,
    required String fullname,
    required String email,
    required String phone,
    required String address,
    required String description,
    required List<ExternalLink> externals,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
