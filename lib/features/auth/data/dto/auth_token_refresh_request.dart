import 'package:json_annotation/json_annotation.dart';

part 'auth_token_refresh_request.g.dart';

@JsonSerializable()
class AuthTokenRefreshRequest {
  final String refresh;

  const AuthTokenRefreshRequest({
    required this.refresh,
  });

  factory AuthTokenRefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenRefreshRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenRefreshRequestToJson(this);
}
