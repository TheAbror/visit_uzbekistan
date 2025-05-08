import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/features/root/single_cty_page/models/single_city_response.dart';

part 'single_city_service.chopper.dart';

@ChopperApi(baseUrl: 'AppStrings.baseLive')
abstract class SingleCityService extends ChopperService {
  static SingleCityService create([ChopperClient? client]) =>
      _$SingleCityService(client ?? ChopperClient());

  // @Get(path: 'cclsmodule/{cclsmodule}')
  @Get(path: 'cclsmodule/166939') //!TODO
  Future<Response<DashboardStudentResponse>> getGeneral(
      {@Path('cclsmodule') int? cclsmodule});
}
