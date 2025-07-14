import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'restaurant_state.dart';

class RestaurantBloc extends Cubit<RestaurantState> {
  RestaurantBloc() : super(RestaurantState.initial());

  void getSingleRestaurant(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getSingleRestaurant(id);

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            restaurant: result,
            blocProgress: BlocProgress.LOADED,
          ));
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      debugPrint('Error getting: $e');

      if (!isClosed) {
        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: e.toString(),
        ));
      }
    }
  }

  void assignRestaurantFromSavedCity(int cityID, int restaurantID) {
    final rawCityData = savedCitiesBox.get(ShPrefKeys.localStorageSavedCity);
    final LocalStorageForCities? cityData = rawCityData;
    final cityItems = cityData?.localStorageCityItems ?? [];

    emit(
      state.copyWith(
        restaurant: cityItems
            .firstWhere((e) => e.id == cityID)
            .restaurants
            .firstWhere((e) => e.id == restaurantID)
            .toSingleItemResponse(),
      ),
    );
  }
}
