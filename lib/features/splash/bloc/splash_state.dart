part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final BlocProgress blocProgress;
  final String failureMessage;

  const SplashState({
    required this.blocProgress,
    required this.failureMessage,
  });

  factory SplashState.initial() {
    return SplashState(
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  SplashState copyWith({
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return SplashState(
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        blocProgress,
        failureMessage,
      ];
}
