import 'package:visit_uzbekistan/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void changeTab(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
  }

  void addFavorite(SingleItemResponse item, BuildContext context) {
    final updatedList = List<SingleItemResponse>.from(state.favorites);

    if (state.favorites.contains(item)) {
      updatedList.remove(item);
    } else {
      updatedList.add(item);
    }

    emit(state.copyWith(favorites: updatedList));
  }
}
