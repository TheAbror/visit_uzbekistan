part of 'transportation_bloc.dart';

class TransportationState extends Equatable {
  final SingleItemResponse carRentals;
  final String failureMessage;
  final BlocProgress blocProgress;

  const TransportationState({
    required this.carRentals,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory TransportationState.initial() {
    return TransportationState(
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
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  TransportationState copyWith({
    SingleItemResponse? carRentals,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return TransportationState(
      carRentals: carRentals ?? this.carRentals,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        carRentals,
        blocProgress,
        failureMessage,
      ];
}
