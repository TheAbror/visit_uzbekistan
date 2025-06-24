part of 'tours_bloc.dart';

class ToursState extends Equatable {
  final SingleToursResponse tour;
  final String failureMessage;
  final BlocProgress blocProgress;

  const ToursState({
    required this.tour,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory ToursState.initial() {
    return ToursState(
      tour: SingleToursResponse(
        id: 0,
        title: '',
        desc: '',
        photo: '',
        url: '',
        shortDescription: '',
        createdAt: '',
        updatedAt: '',
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  ToursState copyWith({
    SingleToursResponse? tour,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return ToursState(
      tour: tour ?? this.tour,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        tour,
        blocProgress,
        failureMessage,
      ];
}
