import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'transportation_state.dart';

class TransportationBloc extends Cubit<TransportationState> {
  TransportationBloc() : super(TransportationState.initial());

  void getRentalCars(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getRentalCars(id);

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            carRentals: result,
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

  void assignTransportFromSavedCity(int cityID, int transportID) {
    final rawCityData = savedCitiesBox.get(ShPrefKeys.localStorageSavedCity);
    final LocalStorageForCities? cityData = rawCityData;
    final cityItems = cityData?.localStorageCityItems ?? [];

    emit(
      state.copyWith(
        carRentals: cityItems
            .firstWhere((e) => e.id == cityID)
            .carRentals
            .firstWhere((e) => e.id == transportID)
            .toSingleItemResponse(),
      ),
    );
  }
}
