// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'single_city_response.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DashboardStudentResponse {
  @JsonKey(defaultValue: 0)
  final int id;

  DashboardStudentResponse({required this.id});

  factory DashboardStudentResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardStudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardStudentResponseToJson(this);
}


//TODO retrofit