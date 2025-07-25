import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void clearAll() {
    emit(state.copyWith(
      attemptedToCheck: false,
      tabIndex: 0,
      blocProgress: BlocProgress.NOT_STARTED,
    ));
  }

  void manageLoader(BlocProgress loaderStatus) {
    emit(state.copyWith(blocProgress: loaderStatus));
  }

  void isInternetOn(bool isConnected) {
    emit(state.copyWith(isInternetOn: isConnected));

    // manageLoader(isConnected);
  }

  void setAttemptedCheck() {
    emit(state.copyWith(attemptedToCheck: true));
  }

  void changeTab(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
  }

  void addFavorite(SingleItemResponse item, BuildContext context) {
    final updatedList = List<SingleItemResponse>.from(state.favoritesInitial);

    if (state.favoritesInitial.contains(item)) {
      updatedList.remove(item);
    } else {
      updatedList.add(item);
    }

    emit(state.copyWith(
      favoritesInitial: updatedList,
      favoritesSearched: updatedList,
    ));
  }

  //  3

  void search(String value) {
    final searchedList = state.favoritesInitial
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(state.copyWith(favoritesSearched: searchedList));
  }
}
