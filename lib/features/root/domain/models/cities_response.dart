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

// {
//   "places": [
//     {
//       "id": 1,
//       "name": "plpp111",
//       "short_desc": "p111",
//       "info": "as dfdklasdnd",
//       "photo": "http://192.168.0.101:8000/storage/uploads/1747507435.jpg",
//       "city_id": 1,
//       "created_at": "2025-05-17T18:43:55.000000Z",
//       "updated_at": "2025-05-17T18:43:55.000000Z"
//     }
//   ]
// }

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class PlacesResponse {
  @JsonKey(defaultValue: [])
  final List<SinglePlaceResponse> places;

  PlacesResponse({required this.places});

  factory PlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SinglePlaceResponse {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0, name: 'city_id')
  final int cityID;
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

  SinglePlaceResponse({
    required this.id,
    required this.cityID,
    required this.name,
    required this.info,
    required this.photo,
    required this.shortDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SinglePlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$SinglePlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SinglePlaceResponseToJson(this);
}
