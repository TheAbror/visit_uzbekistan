// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponse _$CitiesResponseFromJson(Map<String, dynamic> json) =>
    CitiesResponse(
      cities: (json['cities'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CitiesResponseToJson(CitiesResponse instance) =>
    <String, dynamic>{
      'cities': instance.cities.map((e) => e.toJson()).toList(),
    };

PlacesResponse _$PlacesResponseFromJson(Map<String, dynamic> json) =>
    PlacesResponse(
      places: (json['places'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PlacesResponseToJson(PlacesResponse instance) =>
    <String, dynamic>{
      'places': instance.places.map((e) => e.toJson()).toList(),
    };

SingleItemResponse _$SingleItemResponseFromJson(Map<String, dynamic> json) =>
    SingleItemResponse(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      info: json['info'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      shortDescription: json['short_desc'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      cityID: json['city_id'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      cityName: json['city_name'] as String? ?? '',
      isImageTiny: json['isImageTiny'] as bool? ?? false,
    );

Map<String, dynamic> _$SingleItemResponseToJson(SingleItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'short_desc': instance.shortDescription,
      'info': instance.info,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'city_id': instance.cityID,
      'city_name': instance.cityName,
      'rating': instance.rating,
      'isImageTiny': instance.isImageTiny,
    };

SingleCityResponse _$SingleCityResponseFromJson(Map<String, dynamic> json) =>
    SingleCityResponse(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      info: json['info'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      shortDescription: json['short_desc'] as String? ?? '',
      places: (json['places'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      restaurants: (json['restaurants'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SingleCityResponseToJson(SingleCityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'short_desc': instance.shortDescription,
      'info': instance.info,
      'photo': instance.photo,
      'places': instance.places.map((e) => e.toJson()).toList(),
      'restaurants': instance.restaurants.map((e) => e.toJson()).toList(),
    };
