part of 'restaurant_bloc.dart';

class RestaurantState extends Equatable {
  final SingleItemResponse restaurant;
  final String failureMessage;
  final BlocProgress blocProgress;

  const RestaurantState({
    required this.restaurant,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory RestaurantState.initial() {
    return RestaurantState(
      restaurant: SingleItemResponse(
        id: 0,
        name: '',
        info: '',
        location: '',
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

  RestaurantState copyWith({
    SingleItemResponse? restaurant,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RestaurantState(
      restaurant: restaurant ?? this.restaurant,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        restaurant,
        blocProgress,
        failureMessage,
      ];
}
