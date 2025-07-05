part of 'place_bloc.dart';

class PlaceState extends Equatable {
  final SingleItemResponse place;
  final String failureMessage;
  final BlocProgress blocProgress;

  const PlaceState({
    required this.place,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory PlaceState.initial() {
    return PlaceState(
      place: SingleItemResponse(
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

  PlaceState copyWith({
    SingleItemResponse? place,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return PlaceState(
      place: place ?? this.place,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        place,
        blocProgress,
        failureMessage,
      ];
}
