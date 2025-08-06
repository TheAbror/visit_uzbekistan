part of 'plans_bloc.dart';

class PlansState extends Equatable {
  final List<String> selectedCities;
  final List<String> selectedPriceRange;
  final int value;
  final BlocProgress blocProgress;
  final String failureMessage;

  const PlansState({
    required this.selectedCities,
    required this.selectedPriceRange,
    required this.value,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory PlansState.initial() {
    return PlansState(
      selectedCities: [],
      selectedPriceRange: [],
      value: 0,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  PlansState copyWith({
    List<String>? selectedCities,
    List<String>? selectedPriceRange,
    int? value,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return PlansState(
      selectedCities: selectedCities ?? this.selectedCities,
      selectedPriceRange: selectedPriceRange ?? this.selectedPriceRange,
      value: value ?? this.value,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedCities,
        selectedPriceRange,
        value,
        blocProgress,
        failureMessage,
      ];
}
