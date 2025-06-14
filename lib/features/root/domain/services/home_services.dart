import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'home_services.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class HomeServices extends ChopperService {
  static HomeServices create([ChopperClient? client]) =>
      _$HomeServices(client ?? ChopperClient());

  @Get(path: AppStrings.cities)
  Future<Response<CitiesResponse>> getAllCities();

  @Get(path: '${AppStrings.cities}/{id}')
  Future<Response<SingleCityResponse>> getSingleCity(@Path('id') int id);

  @Get(path: AppStrings.places)
  Future<Response<PlacesResponse>> getAllPlaces();

  @Get(path: '${AppStrings.places}/{id}')
  Future<Response<SingleItemResponse>> getSinglePlace(@Path('id') int id);

  @Get(path: AppStrings.articles)
  Future<Response<ArticlesResponse>> getAllArticels();

  @Get(path: '${AppStrings.articles}/{id}')
  Future<Response<SingleArticleResponse>> getSingleArticle(@Path('id') int id);

  @Get(path: '${AppStrings.restaurants}/{id}')
  Future<Response<SingleItemResponse>> getSingleRestaurant(@Path('id') int id);

  //not being used so far
  @Get(path: '${AppStrings.carRentals}/{id}')
  Future<Response<SingleItemResponse>> getRentalCars(@Path('id') int id);
}
