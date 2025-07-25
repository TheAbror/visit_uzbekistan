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
  Future<Response<SingleItemResponse>> getSingleArticle(@Path('id') int id);

  @Get(path: AppStrings.tours)
  Future<Response<ToursResponse>> getAllTours();

  @Get(path: '${AppStrings.tours}/{id}')
  Future<Response<SingleItemResponse>> getSingleTour(@Path('id') int id);

  @Get(path: '${AppStrings.restaurants}/{id}')
  Future<Response<SingleItemResponse>> getSingleRestaurant(@Path('id') int id);

  @Get(path: '${AppStrings.carRentals}/{id}')
  Future<Response<SingleItemResponse>> getRentalCars(@Path('id') int id);

  // http://travel.getcontact.uz/useful_apps

  @Get(path: AppStrings.usefulApps)
  Future<Response<UsefulAppResponse>> getAllUsefulApps();

  @Get(path: '${AppStrings.usefulApps}/{id}')
  Future<Response<SingleItemResponse>> getSingleUsefulApp(@Path('id') int id);
}
