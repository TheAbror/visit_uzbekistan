part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final String token;
  final BlocProgress blocProgress;
  final String failureMessage;

  const SplashState({
    required this.token,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory SplashState.initial() {
    return SplashState(
      token: '',
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  SplashState copyWith({
    String? token,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return SplashState(
      token: token ?? this.token,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        token,
        blocProgress,
        failureMessage,
      ];
}
