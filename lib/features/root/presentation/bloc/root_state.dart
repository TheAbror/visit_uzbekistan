part of 'root_bloc.dart';

class RootState extends Equatable {
  final int tabIndex;
  final List<SingleCityResponse> cities;
  final List<SinglePlaceResponse> places;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.tabIndex,
    required this.cities,
    required this.places,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      tabIndex: 0,
      cities: [],
      places: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    int? tabIndex,
    List<SingleCityResponse>? cities,
    List<SinglePlaceResponse>? places,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      tabIndex: tabIndex ?? this.tabIndex,
      cities: cities ?? this.cities,
      places: places ?? this.places,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        tabIndex,
        cities,
        places,
        blocProgress,
        failureMessage,
      ];
}
