// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_city_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SingleCityService extends SingleCityService {
  _$SingleCityService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SingleCityService;

  @override
  Future<Response<DashboardStudentResponse>> getGeneral({int? cclsmodule}) {
    final Uri $url = Uri.parse('AppStrings.baseLive/cclsmodule/166939');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<DashboardStudentResponse, DashboardStudentResponse>($request);
  }
}
