import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'tours_state.dart';

class ToursBloc extends Cubit<ToursState> {
  ToursBloc() : super(ToursState.initial());

  void getSingleTour(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getSingleTour(id);

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            tour: result,
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

  void assignTourFromSavedCity(int cityID, int tourID) {
    final rawCityData = savedCitiesBox.get(ShPrefKeys.localStorageSavedCity);
    final LocalStorageForCities? cityData = rawCityData;
    final cityItems = cityData?.localStorageCityItems ?? [];

    emit(
      state.copyWith(
        tour: cityItems
            .firstWhere((e) => e.id == cityID)
            .tours
            .firstWhere((e) => e.id == tourID)
            .toSingleItemResponse(),
      ),
    );
  }
}
