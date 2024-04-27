import 'package:json_annotation/json_annotation.dart';

part 'auth_token_request.g.dart';

@JsonSerializable()
class AuthTokenRequest {
  final String username;
  final String password;

  const AuthTokenRequest({
    required this.username,
    required this.password,
  });

  factory AuthTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenRequestToJson(this);
}
