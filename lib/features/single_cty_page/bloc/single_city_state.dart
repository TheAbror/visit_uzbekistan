part of 'single_city_bloc.dart';

class SingleCityState extends Equatable {
  final String failureMessage;
  final BlocProgress blocProgress;

  const SingleCityState({
    required this.failureMessage,
    required this.blocProgress,
  });

  factory SingleCityState.initial() {
    return const SingleCityState(
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  SingleCityState copyWith({
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return SingleCityState(
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        blocProgress,
        failureMessage,
      ];
}
