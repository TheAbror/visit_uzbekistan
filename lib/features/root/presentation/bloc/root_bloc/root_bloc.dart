import 'package:visit_uzbekistan/widgets/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

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

  void search(String value) {
    final searchedList = state.favoritesInitial
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(state.copyWith(favoritesSearched: searchedList));
  }
}
