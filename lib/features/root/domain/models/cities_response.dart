import 'package:json_annotation/json_annotation.dart';

part 'cities_response.g.dart';

// {
//   "cities": [
//     {
//       "id": 1,
//       "name": "xiva",
//       "short_desc": "asdasd",
//       "info": "asdasdsa\r\nasdasd",
//       "created_at": "2025-05-17T16:48:14.000000Z",
//       "updated_at": "2025-05-17T16:48:14.000000Z"
//     }
//   ]
// }

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CitiesResponse {
  @JsonKey(defaultValue: [])
  final List<SingleCityResponse> cities;

  CitiesResponse({required this.cities});

  factory CitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$CitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SingleCityResponse {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '', name: 'short_desc')
  final String shortDescription;
  @JsonKey(defaultValue: '')
  final String info;
  @JsonKey(defaultValue: '')
  final String photo;
  @JsonKey(defaultValue: '', name: 'created_at')
  final String createdAt;
  @JsonKey(defaultValue: '', name: 'updated_at')
  final String updatedAt;

  SingleCityResponse({
    required this.id,
    required this.name,
    required this.info,
    required this.photo,
    required this.shortDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SingleCityResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleCityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleCityResponseToJson(this);
}
