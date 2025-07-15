part of 'plans_bloc.dart';

class PlansState extends Equatable {
  final List<String> selectedCities;
  final int value;
  final BlocProgress blocProgress;
  final String failureMessage;

  const PlansState({
    required this.selectedCities,
    required this.value,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory PlansState.initial() {
    return PlansState(
      selectedCities: [],
      value: 0,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  PlansState copyWith({
    List<String>? selectedCities,
    int? value,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return PlansState(
      selectedCities: selectedCities ?? this.selectedCities,
      value: value ?? this.value,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedCities,
        value,
        blocProgress,
        failureMessage,
      ];
}
