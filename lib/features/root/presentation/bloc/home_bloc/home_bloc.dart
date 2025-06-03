import 'package:visit_uzbekistan/widgets/widget_imports.dart';

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

  void getAllPlaces(BuildContext context) async {
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
