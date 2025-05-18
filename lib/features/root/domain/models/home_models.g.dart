// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponse _$CitiesResponseFromJson(Map<String, dynamic> json) =>
    CitiesResponse(
      cities: (json['cities'] as List<dynamic>?)
              ?.map(
                  (e) => SingleCityResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CitiesResponseToJson(CitiesResponse instance) =>
    <String, dynamic>{
      'cities': instance.cities.map((e) => e.toJson()).toList(),
    };

SingleCityResponse _$SingleCityResponseFromJson(Map<String, dynamic> json) =>
    SingleCityResponse(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      info: json['info'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      shortDescription: json['short_desc'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$SingleCityResponseToJson(SingleCityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_desc': instance.shortDescription,
      'info': instance.info,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

PlacesResponse _$PlacesResponseFromJson(Map<String, dynamic> json) =>
    PlacesResponse(
      places: (json['places'] as List<dynamic>?)
              ?.map((e) =>
                  SinglePlaceResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PlacesResponseToJson(PlacesResponse instance) =>
    <String, dynamic>{
      'places': instance.places.map((e) => e.toJson()).toList(),
    };

SinglePlaceResponse _$SinglePlaceResponseFromJson(Map<String, dynamic> json) =>
    SinglePlaceResponse(
      id: json['id'] as int? ?? 0,
      cityID: json['city_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      info: json['info'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      shortDescription: json['short_desc'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$SinglePlaceResponseToJson(
        SinglePlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city_id': instance.cityID,
      'name': instance.name,
      'short_desc': instance.shortDescription,
      'info': instance.info,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
