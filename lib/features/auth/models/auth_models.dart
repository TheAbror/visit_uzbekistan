import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';

@JsonSerializable(includeIfNull: true)
class LogInRequest {
  final String email;
  final String password;

  LogInRequest({
    required this.email,
    required this.password,
  });

  factory LogInRequest.fromJson(Map<String, dynamic> json) =>
      _$LogInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogInRequestToJson(this);
}

@JsonSerializable(includeIfNull: true)
class LogInResponse {
  @JsonKey(defaultValue: '')
  final String message;
  @JsonKey()
  final LogInDataResponse data;

  LogInResponse({
    required this.message,
    required this.data,
  });

  factory LogInResponse.fromJson(Map<String, dynamic> json) =>
      _$LogInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogInResponseToJson(this);
}

@JsonSerializable(includeIfNull: true)
class LogInDataResponse {
  @JsonKey()
  final UserResponse user;
  @JsonKey(defaultValue: '')
  final String token;

  LogInDataResponse({
    required this.user,
    required this.token,
  });

  factory LogInDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LogInDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogInDataResponseToJson(this);
}

@JsonSerializable(includeIfNull: true)
class UserResponse {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '', name: 'created_at')
  final String createdAt;
  @JsonKey(defaultValue: '', name: 'updated_at')
  final String updatedAt;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable(includeIfNull: true)
class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
