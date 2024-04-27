// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenRequest _$AuthTokenRequestFromJson(Map<String, dynamic> json) =>
    AuthTokenRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthTokenRequestToJson(AuthTokenRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
