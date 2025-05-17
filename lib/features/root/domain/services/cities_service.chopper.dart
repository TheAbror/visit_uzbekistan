// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CitiesService extends CitiesService {
  _$CitiesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CitiesService;

  @override
  Future<Response<CitiesResponse>> getCities() {
    final Uri $url =
        Uri.parse('https://39fd-213-230-92-231.ngrok-free.app/api/cities');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CitiesResponse, CitiesResponse>($request);
  }
}
