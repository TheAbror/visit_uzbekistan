import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'plans_state.dart';

class PlansBloc extends Cubit<PlansState> {
  PlansBloc() : super(PlansState.initial());

  void clearAll() {
    emit(PlansState.initial());
  }

  void calculator(int calculatorValue) {
    emit(state.copyWith(calculatorValue: calculatorValue * 12720));

    print(state.calculatorValue);
  }

  void addCity(String value) {
    List<CityWithDays> updatedSelection =
        List<CityWithDays>.from(state.selectedCities);

    final index = updatedSelection.indexWhere((c) => c.city == value);

    if (index != -1) {
      updatedSelection.removeAt(index);
    } else {
      updatedSelection.add(CityWithDays(city: value));
    }

    emit(state.copyWith(selectedCities: updatedSelection));
  }

  void addCityTravelDays(bool isIncrement, int index) {
    List<CityWithDays> updatedSelection =
        List<CityWithDays>.from(state.selectedCities);

    if (isIncrement) {
      final currentCity = updatedSelection[index];
      updatedSelection[index] = CityWithDays(
        city: currentCity.city,
        days: currentCity.days + 1,
      );
    }

    if (!isIncrement) {
      final currentCity = updatedSelection[index];
      if (currentCity.days > 1)
        updatedSelection[index] = CityWithDays(
          city: currentCity.city,
          days: currentCity.days - 1,
        );
    }

    emit(state.copyWith(selectedCities: updatedSelection));
  }

  void addPriceRange(String value) {
    List<String> updatedSelection = List<String>.from(state.selectedPriceRange);

    if (updatedSelection.contains(value)) {
      updatedSelection.remove(value);
    } else {
      updatedSelection.add(value);
    }

    emit(state.copyWith(selectedPriceRange: [updatedSelection.last]));
  }
}
