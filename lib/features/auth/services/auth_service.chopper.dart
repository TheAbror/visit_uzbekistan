// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthService;

  @override
  Future<Response<LogInResponse>> logIn(LogInRequest body) {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/client/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LogInResponse, LogInResponse>($request);
  }

  @override
  Future<Response<LogInResponse>> register(RegisterRequest body) {
    final Uri $url =
        Uri.parse('http://travel.getcontact.uz/api/client/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LogInResponse, LogInResponse>($request);
  }
}
