import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'plans_state.dart';

class PlansBloc extends Cubit<PlansState> {
  PlansBloc() : super(PlansState.initial());

  void clearAll() {
    emit(PlansState.initial());
  }

  void calculator(int value) {
    emit(state.copyWith(value: value * 12720));

    print(state.value);
  }

  void addCity(String value) {
    List<String> updatedSelection = List<String>.from(state.selectedCities);

    if (updatedSelection.contains(value)) {
      updatedSelection.remove(value);
    } else {
      updatedSelection.add(value);
    }

    emit(state.copyWith(selectedCities: updatedSelection));
  }
}
