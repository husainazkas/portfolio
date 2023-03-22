import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({int? code, String? message}) = ServerFailure;
  const factory Failure.local({int? code, String? message}) = LocalFailure;
  const factory Failure.unknown({int? code, String? message}) = UnknownFailure;
}
