import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'city_state.dart';

class CityBloc extends Cubit<CityState> {
  CityBloc() : super(CityState.initial());

  saveSingleCityToHive() {
    final _box = savedCitiesBox.get(ShPrefKeys.localStorageSavedCity);
    final _whenEmpty = LocalStorageForCities(localStorageCityItems: []);

    final LocalStorageForCities? savedItems = _box ?? _whenEmpty;
    final response = state.response.toSingleCityModel();

    savedCitiesBox.put(
      ShPrefKeys.localStorageSavedCity,
      LocalStorageForCities(
        localStorageCityItems: [
          ...savedItems?.localStorageCityItems ?? [],
          response,
        ],
      ),
    );

    print(savedItems);

    return true;
  }

  // http://192.168.0.101:8000/api/cities/1

  void getSingleCity(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getSingleCity(id);

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          final singleCityItem = SingleItemResponse(
            id: id,
            name: result.name,
            location: result.location,
            info: result.info,
            photo: result.photo,
            shortDescription: result.shortDescription,
            createdAt: '',
            updatedAt: '',
            type: '',
          );

          emit(state.copyWith(
            response: result,
            singleItem: singleCityItem,
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
