part of 'plans_bloc.dart';

class PlansState extends Equatable {
  final List<CityWithDays> selectedCities;
  final List<String> selectedPriceRange;
  final int calculatorValue;
  final bool isFinalCostReady;
  final BlocProgress blocProgress;
  final String failureMessage;

  const PlansState({
    required this.selectedCities,
    required this.selectedPriceRange,
    required this.calculatorValue,
    required this.isFinalCostReady,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory PlansState.initial() {
    return PlansState(
      selectedCities: [],
      selectedPriceRange: [],
      calculatorValue: 0,
      isFinalCostReady: false,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  PlansState copyWith({
    List<CityWithDays>? selectedCities,
    List<String>? selectedPriceRange,
    int? calculatorValue,
    bool? isFinalCostReady,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return PlansState(
      selectedCities: selectedCities ?? this.selectedCities,
      selectedPriceRange: selectedPriceRange ?? this.selectedPriceRange,
      calculatorValue: calculatorValue ?? this.calculatorValue,
      isFinalCostReady: isFinalCostReady ?? this.isFinalCostReady,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedCities,
        selectedPriceRange,
        calculatorValue,
        isFinalCostReady,
        blocProgress,
        failureMessage,
      ];
}

class CityWithDays {
  final String city;
  final int days;

  CityWithDays({
    required this.city,
    this.days = 1,
  });
}
