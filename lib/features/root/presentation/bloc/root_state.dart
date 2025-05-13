part of 'root_bloc.dart';

class RootState extends Equatable {
  final int tabIndex;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.tabIndex,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      tabIndex: 0,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    int? tabIndex,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      tabIndex: tabIndex ?? this.tabIndex,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        tabIndex,
        blocProgress,
        failureMessage,
      ];
}
