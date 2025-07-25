import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'view_all_state.dart';

class ViewAllBloc extends Cubit<ViewAllState> {
  ViewAllBloc() : super(ViewAllState.initial());

  void clearAll() {
    emit(ViewAllState.initial());
  }

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
