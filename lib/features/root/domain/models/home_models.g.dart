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

UsefulAppResponse _$UsefulAppResponseFromJson(Map<String, dynamic> json) =>
    UsefulAppResponse(
      usefulApps: (json['useful_apps'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UsefulAppResponseToJson(UsefulAppResponse instance) =>
    <String, dynamic>{
      'useful_apps': instance.usefulApps.map((e) => e.toJson()).toList(),
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
      type: json['type'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      link: json['link'] as String? ?? '',
      androidLink: json['android_link'] as String? ?? '',
      iosLink: json['ios_link'] as String? ?? '',
      cityName: json['city_name'] as String? ?? '',
      isImageTiny: json['isImageTiny'] as bool? ?? false,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) =>
                  ListOfImagesResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
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
      'link': instance.link,
      'android_link': instance.androidLink,
      'ios_link': instance.iosLink,
      'type': instance.type,
      'rating': instance.rating,
      'isImageTiny': instance.isImageTiny,
      'images': instance.images?.map((e) => e.toJson()).toList(),
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
      articles: (json['articles'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      carRentals: (json['carRentals'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tours: (json['tours'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) =>
                  ListOfImagesResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      type: json['type'] as String? ?? '',
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
      'articles': instance.articles.map((e) => e.toJson()).toList(),
      'carRentals': instance.carRentals.map((e) => e.toJson()).toList(),
      'tours': instance.tours.map((e) => e.toJson()).toList(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'type': instance.type,
    };

ListOfImagesResponse _$ListOfImagesResponseFromJson(
        Map<String, dynamic> json) =>
    ListOfImagesResponse(
      path: json['path'] as String? ?? '',
    );

Map<String, dynamic> _$ListOfImagesResponseToJson(
        ListOfImagesResponse instance) =>
    <String, dynamic>{
      'path': instance.path,
    };

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) =>
    ArticlesResponse(
      articles: (json['articles'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ArticlesResponseToJson(ArticlesResponse instance) =>
    <String, dynamic>{
      'articles': instance.articles.map((e) => e.toJson()).toList(),
    };

ToursResponse _$ToursResponseFromJson(Map<String, dynamic> json) =>
    ToursResponse(
      tours: (json['tours'] as List<dynamic>?)
              ?.map(
                  (e) => SingleItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ToursResponseToJson(ToursResponse instance) =>
    <String, dynamic>{
      'tours': instance.tours.map((e) => e.toJson()).toList(),
    };
