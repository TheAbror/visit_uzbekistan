import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.initial());

  void homeTabFilter(String value) {
    final updatedList = List<String>.from(state.filterItemsSelected);

    if (state.filterItemsSelected.contains(value)) {
      updatedList.remove(value);
    } else {
      updatedList.add(value);
    }

    emit(state.copyWith(filterItemsSelected: updatedList));
  }

  void getAllUsefulApps(BuildContext context) async {
    emit(state.copyWith(
      usefulApps:
          state.usefulApps.copyWith(blocProgress: BlocProgress.IS_LOADING),
    ));

    try {
      final response = await ApiProvider.homeServices.getAllUsefulApps();

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(
            state.copyWith(
              usefulApps: state.usefulApps.copyWith(
                model: result.usefulApps,
                blocProgress: BlocProgress.LOADED,
              ),
            ),
          );
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            usefulApps: state.usefulApps.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: error.message,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting: $e');

      if (!isClosed) {
        emit(
          state.copyWith(
            usefulApps: state.usefulApps.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: e.toString(),
            ),
          ),
        );
      }
    }
  }

  void getSingleUsefulApp(BuildContext context, int id) async {
    emit(
      state.copyWith(
        usefulApps: state.usefulApps.copyWith(
          blocProgress: BlocProgress.IS_LOADING,
        ),
      ),
    );

    try {
      final response = await ApiProvider.homeServices.getSingleUsefulApp(id);

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(
            state.copyWith(
              singleUsefulApp: state.singleUsefulApp.copyWith(
                model: result,
                blocProgress: BlocProgress.LOADED,
              ),
            ),
          );
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            usefulApps: state.usefulApps.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: error.message,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting: $e');

      if (!isClosed) {
        emit(
          state.copyWith(
            usefulApps: state.usefulApps.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: e.toString(),
            ),
          ),
        );
      }
    }
  }

  void getAllPlaces(BuildContext context) async {
    emit(state.copyWith(
      places: state.places.copyWith(blocProgress: BlocProgress.IS_LOADING),
    ));

    try {
      final response = await ApiProvider.homeServices.getAllPlaces();

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(
            state.copyWith(
              places: state.places.copyWith(
                model: result.places,
                blocProgress: BlocProgress.LOADED,
              ),
            ),
          );
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            places: state.places.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: error.message,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting: $e');

      if (!isClosed) {
        emit(
          state.copyWith(
            places: state.places.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: e.toString(),
            ),
          ),
        );
      }
    }
  }

  void getAllTours(BuildContext context) async {
    emit(state.copyWith(
      tours: state.tours.copyWith(blocProgress: BlocProgress.IS_LOADING),
    ));

    try {
      final response = await ApiProvider.homeServices.getAllTours();

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(
            state.copyWith(
              tours: state.tours.copyWith(
                model: result.tours,
                blocProgress: BlocProgress.LOADED,
              ),
            ),
          );
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            tours: state.tours.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: error.message,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting: $e');

      if (!isClosed) {
        emit(
          state.copyWith(
            tours: state.tours.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: e.toString(),
            ),
          ),
        );
      }
    }
  }

  void getAllArticels(BuildContext context) async {
    emit(
      state.copyWith(
        articles: state.articles.copyWith(
          blocProgress: BlocProgress.IS_LOADING,
        ),
      ),
    );

    try {
      final response = await ApiProvider.homeServices.getAllArticels();

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(
            state.copyWith(
              articles: state.articles.copyWith(
                model: result,
                blocProgress: BlocProgress.LOADED,
              ),
            ),
          );
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          articles: state.articles.copyWith(
            blocProgress: BlocProgress.FAILED,
            failureMessage: error.message,
          ),
        ));
      }
    } catch (e) {
      debugPrint('Error getting: $e');

      if (!isClosed) {
        emit(state.copyWith(
          articles: state.articles.copyWith(
            blocProgress: BlocProgress.FAILED,
            failureMessage: e.toString(),
          ),
        ));
      }
    }
  }

  void getSingleArticle(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.homeServices.getSingleArticle(id);

      if (response.isSuccessful) {
        final result = response.body;

        if (result != null) {
          emit(state.copyWith(
            singleArticle: result,
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
