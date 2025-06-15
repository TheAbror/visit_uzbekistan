part of 'cities_tab_bloc.dart';

class CitiesTabState extends Equatable {
  final List<SingleItemResponse> cities;
  final List<SingleItemResponse> citiesSearched;
  final BlocProgress blocProgress;
  final String failureMessage;

  const CitiesTabState({
    required this.cities,
    required this.citiesSearched,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory CitiesTabState.initial() {
    return CitiesTabState(
      cities: [],
      citiesSearched: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  CitiesTabState copyWith({
    List<SingleItemResponse>? cities,
    List<SingleItemResponse>? citiesSearched,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return CitiesTabState(
      cities: cities ?? this.cities,
      citiesSearched: citiesSearched ?? this.citiesSearched,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        cities,
        citiesSearched,
        blocProgress,
        failureMessage,
      ];
}
