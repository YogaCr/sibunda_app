import 'package:common/arch/domain/model/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_api_model.g.dart';

class LogoutBody {
  final SessionData session;
  LogoutBody(this.session);

  @override
  String toString() => session.toAuthString();
}

@JsonSerializable()
class LogoutResponse extends Equatable {
  final String message;
  final String status;
  final int code;

  LogoutResponse({
    required this.code,
    required this.status,
    required this.message,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> map) => _$LogoutResponseFromJson(map);

  @override
  List<Object?> get props => [code, message, status];
}