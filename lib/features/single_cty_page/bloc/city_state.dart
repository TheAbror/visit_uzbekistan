part of 'city_bloc.dart';

class CityState extends Equatable {
  final SingleCityResponse response;
  final String failureMessage;
  final BlocProgress blocProgress;

  const CityState({
    required this.response,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory CityState.initial() {
    return CityState(
      response: SingleCityResponse(
        id: 0,
        name: '',
        info: '',
        location: '',
        photo: '',
        shortDescription: '',
        articles: [],
        places: [],
        restaurants: [],
        carRentals: [],
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  CityState copyWith({
    SingleCityResponse? response,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return CityState(
      response: response ?? this.response,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        response,
        blocProgress,
        failureMessage,
      ];
}
