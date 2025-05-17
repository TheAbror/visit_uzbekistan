import 'package:visit_uzbekistan/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void getCities() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.citiesService.getCities();

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
      debugPrint('Error getting inquiries: $e');

      if (!isClosed) {
        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          // failureMessage: AppStrings.internalErrorMessage,
        ));
      }
    }
  }

  void getPlaces() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.citiesService.getPlaces();

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
      debugPrint('Error getting inquiries: $e');

      if (!isClosed) {
        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          // failureMessage: AppStrings.internalErrorMessage,
        ));
      }
    }
  }

  void changeTab(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
  }
}
