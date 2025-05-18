part of 'single_city_bloc.dart';

class SingleCityState extends Equatable {
  final SingleCityResponse response;
  final String failureMessage;
  final BlocProgress blocProgress;

  const SingleCityState({
    required this.response,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory SingleCityState.initial() {
    return SingleCityState(
      response: SingleCityResponse(
        id: 0,
        name: '',
        info: '',
        photo: '',
        shortDescription: '',
        places: [],
        restaurants: [],
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  SingleCityState copyWith({
    SingleCityResponse? response,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return SingleCityState(
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
