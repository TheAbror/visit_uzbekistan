import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

part 'home_services.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class HomeServices extends ChopperService {
  static HomeServices create([ChopperClient? client]) =>
      _$HomeServices(client ?? ChopperClient());

  @Get(path: AppStrings.cities)
  Future<Response<CitiesResponse>> getAllCities();

  @Get(path: '${AppStrings.cities}/{id}')
  Future<Response<CitiesResponse>> getSingleCity(@Path('id') int id);

  @Get(path: AppStrings.places)
  Future<Response<PlacesResponse>> getAllPlaces();

  @Get(path: '${AppStrings.places}/{id}')
  Future<Response<PlacesResponse>> getSinglePlace(@Path('id') int id);
}
