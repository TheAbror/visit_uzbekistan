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
    final Uri $url =
        Uri.parse('https://39fd-213-230-92-231.ngrok-free.app/api/cities');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CitiesResponse, CitiesResponse>($request);
  }

  @override
  Future<Response<CitiesResponse>> getSingleCity(int id) {
    final Uri $url = Uri.parse(
        'https://39fd-213-230-92-231.ngrok-free.app/api/cities/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CitiesResponse, CitiesResponse>($request);
  }

  @override
  Future<Response<PlacesResponse>> getAllPlaces() {
    final Uri $url =
        Uri.parse('https://39fd-213-230-92-231.ngrok-free.app/api/places');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PlacesResponse, PlacesResponse>($request);
  }

  @override
  Future<Response<PlacesResponse>> getSinglePlace(int id) {
    final Uri $url = Uri.parse(
        'https://39fd-213-230-92-231.ngrok-free.app/api/places/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PlacesResponse, PlacesResponse>($request);
  }
}
