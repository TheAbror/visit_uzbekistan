import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'cities_tab_state.dart';

class CitiesTabBloc extends Cubit<CitiesTabState> {
  CitiesTabBloc() : super(CitiesTabState.initial());

  void clearAll() {
    emit(CitiesTabState.initial());
  }

  void getAllCities(BuildContext context) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getAllCities();

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            cities: result.cities,
            citiesSearched: result.cities,
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

  void search(String value) {
    final searchedList = state.cities
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(state.copyWith(citiesSearched: searchedList));
  }
}
