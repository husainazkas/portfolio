import 'package:freezed_annotation/freezed_annotation.dart';

part 'external_link.freezed.dart';
part 'external_link.g.dart';

@Freezed(toJson: false)
class ExternalLink with _$ExternalLink {
  const factory ExternalLink({
    required String label,
    required String? url,
    required String type,
  }) = _ExternalLink;

  factory ExternalLink.fromJson(Map<String, dynamic> json) =>
      _$ExternalLinkFromJson(json);
}
