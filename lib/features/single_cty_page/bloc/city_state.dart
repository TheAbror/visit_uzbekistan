part of 'city_bloc.dart';

class CityState extends Equatable {
  final ReviewsResponse reviews;
  final SingleCityResponse response;
  //needed to make SingleCityResponse into SingleItemResponse to save
  final SingleItemResponse singleItem;
  final SingleItemResponse carRentals;
  final SingleItemResponse tours;
  final String failureMessage;
  final BlocProgress blocProgress;

  const CityState({
    required this.reviews,
    required this.response,
    required this.singleItem,
    required this.carRentals,
    required this.tours,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory CityState.initial() {
    return CityState(
      reviews: ReviewsResponse(currentPage: 0, data: []),
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
    ReviewsResponse? reviews,
    SingleCityResponse? response,
    SingleItemResponse? singleItem,
    SingleItemResponse? carRentals,
    SingleItemResponse? tours,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return CityState(
      reviews: reviews ?? this.reviews,
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
        reviews,
        response,
        singleItem,
        carRentals,
        tours,
        blocProgress,
        failureMessage,
      ];
}
