import 'package:visit_uzbekistan/widget_imports.dart';

part 'search_state.dart';

class SearchBloc extends Cubit<SearchState> {
  SearchBloc() : super(SearchState.initial());

  void loadInitialList(List<String> items) {
    emit(state.copyWith(
      initialList: items,
      searchedList: items,
    ));
  }

  void addFromFavorite(String item) {
    final updatedList = List<String>.from(state.initialList);

    updatedList.add(item);

    emit(state.copyWith(initialList: updatedList));
  }

  void search(String value) {
    final searchedList = state.initialList
        .where((element) => element.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(state.copyWith(searchedList: searchedList));
  }
}
