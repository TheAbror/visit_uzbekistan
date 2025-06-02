import 'package:visit_uzbekistan/widget_imports.dart';

part 'view_all_state.dart';

class ViewAllBloc extends Cubit<ViewAllState> {
  ViewAllBloc() : super(ViewAllState.initial());

  void search(String value) {
    final searchedList = state.initialList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(state.copyWith(searchedList: searchedList));
    print(searchedList.length);
  }

  void assignSearchValues(List<SingleItemResponse> items) {
    emit(state.copyWith(
      initialList: items,
      searchedList: items,
    ));
  }
}
