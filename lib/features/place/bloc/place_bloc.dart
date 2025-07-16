import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'place_state.dart';

class PlaceBloc extends Cubit<PlaceState> {
  PlaceBloc() : super(PlaceState.initial());

  void clearAll() {
    emit(PlaceState.initial());
  }

  void getSinglePlace(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getSinglePlace(id);

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            place: result,
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

  void assignPlaceFromSavedCity(int cityID, int placeID) {
    final rawCityData = savedCitiesBox.get(ShPrefKeys.localStorageSavedCity);
    final LocalStorageForCities? cityData = rawCityData;
    final cityItems = cityData?.localStorageCityItems ?? [];

    emit(
      state.copyWith(
        place: cityItems
            .firstWhere((e) => e.id == cityID)
            .places
            .firstWhere((e) => e.id == placeID)
            .toSingleItemResponse(),
      ),
    );
  }
}
