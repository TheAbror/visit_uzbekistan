import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

part 'cities_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class CitiesService extends ChopperService {
  static CitiesService create([ChopperClient? client]) =>
      _$CitiesService(client ?? ChopperClient());

  @Get(path: AppStrings.cities)
  Future<Response<CitiesResponse>> getCities();
}
