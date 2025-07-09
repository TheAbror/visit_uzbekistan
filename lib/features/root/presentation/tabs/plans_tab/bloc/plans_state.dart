part of 'plans_bloc.dart';

class PlansState extends Equatable {
  final int value;
  final BlocProgress blocProgress;
  final String failureMessage;

  const PlansState({
    required this.value,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory PlansState.initial() {
    return PlansState(
      value: 0,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  PlansState copyWith({
    int? value,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return PlansState(
      value: value ?? this.value,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        value,
        blocProgress,
        failureMessage,
      ];
}
