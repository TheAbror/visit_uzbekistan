import 'package:visit_uzbekistan/widget_imports.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.initial());

  void getAllCities() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getAllCities();

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            cities: result.cities,
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

  void getAllPlaces() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getAllPlaces();

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            places: result.places,
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
}
