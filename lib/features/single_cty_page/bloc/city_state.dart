part of 'city_bloc.dart';

class CityState extends Equatable {
  final SingleCityResponse response;
  final SingleItemResponse singleItem;
  final SingleItemResponse carRentals;
  final SingleItemResponse tours;
  final String failureMessage;
  final BlocProgress blocProgress;

  const CityState({
    required this.response,
    required this.singleItem,
    required this.carRentals,
    required this.tours,
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
        tours: [],
        carRentals: [],
        images: [],
        type: '',
      ),
      singleItem: SingleItemResponse(
        id: 0,
        name: '',
        location: '',
        info: '',
        photo: '',
        shortDescription: '',
        createdAt: '',
        updatedAt: '',
        type: '',
      ),
      carRentals: SingleItemResponse(
        id: 0,
        name: '',
        location: '',
        info: '',
        photo: '',
        shortDescription: '',
        createdAt: '',
        updatedAt: '',
        type: '',
      ),
      tours: SingleItemResponse(
        id: 0,
        name: '',
        location: '',
        info: '',
        photo: '',
        shortDescription: '',
        createdAt: '',
        updatedAt: '',
        type: '',
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  CityState copyWith({
    SingleCityResponse? response,
    SingleItemResponse? singleItem,
    SingleItemResponse? carRentals,
    SingleItemResponse? tours,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return CityState(
      response: response ?? this.response,
      singleItem: singleItem ?? this.singleItem,
      carRentals: carRentals ?? this.carRentals,
      tours: tours ?? this.tours,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        response,
        singleItem,
        carRentals,
        tours,
        blocProgress,
        failureMessage,
      ];
}
