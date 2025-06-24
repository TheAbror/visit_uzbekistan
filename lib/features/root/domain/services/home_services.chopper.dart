// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$HomeServices extends HomeServices {
  _$HomeServices([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = HomeServices;

  @override
  Future<Response<CitiesResponse>> getAllCities() {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/cities');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CitiesResponse, CitiesResponse>($request);
  }

  @override
  Future<Response<SingleCityResponse>> getSingleCity(int id) {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/cities/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SingleCityResponse, SingleCityResponse>($request);
  }

  @override
  Future<Response<PlacesResponse>> getAllPlaces() {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/places');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PlacesResponse, PlacesResponse>($request);
  }

  @override
  Future<Response<SingleItemResponse>> getSinglePlace(int id) {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/places/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SingleItemResponse, SingleItemResponse>($request);
  }

  @override
  Future<Response<ArticlesResponse>> getAllArticels() {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/articles');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ArticlesResponse, ArticlesResponse>($request);
  }

  @override
  Future<Response<SingleArticleResponse>> getSingleArticle(int id) {
    final Uri $url =
        Uri.parse('http://travel.getcontact.uz/api/articles/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SingleArticleResponse, SingleArticleResponse>($request);
  }

  @override
  Future<Response<ToursResponse>> getAllTours() {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/tours');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ToursResponse, ToursResponse>($request);
  }

  @override
  Future<Response<SingleToursResponse>> getSingleTour(int id) {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/tours/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SingleToursResponse, SingleToursResponse>($request);
  }

  @override
  Future<Response<SingleItemResponse>> getSingleRestaurant(int id) {
    final Uri $url =
        Uri.parse('http://travel.getcontact.uz/api/restaurants/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SingleItemResponse, SingleItemResponse>($request);
  }

  @override
  Future<Response<SingleItemResponse>> getRentalCars(int id) {
    final Uri $url =
        Uri.parse('http://travel.getcontact.uz/api/car_rentals/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SingleItemResponse, SingleItemResponse>($request);
  }
}
