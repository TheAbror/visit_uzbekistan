part of 'cities_bloc.dart';

class CitiesState extends Equatable {
  final List<SingleItemResponse> cities;
  final List<SingleItemResponse> citiesSearched;
  final BlocProgress blocProgress;
  final String failureMessage;

  const CitiesState({
    required this.cities,
    required this.citiesSearched,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory CitiesState.initial() {
    return CitiesState(
      cities: [],
      citiesSearched: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  CitiesState copyWith({
    List<SingleItemResponse>? cities,
    List<SingleItemResponse>? citiesSearched,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return CitiesState(
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
