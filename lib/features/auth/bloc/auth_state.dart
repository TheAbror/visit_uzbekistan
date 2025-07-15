part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final LogInResponse response;
  final BlocProgress blocProgress;
  final String failureMessage;

  const AuthState({
    required this.response,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory AuthState.initial() {
    return AuthState(
      response: LogInResponse(
        message: '',
        data: LogInDataResponse(
          token: '',
          user: UserResponse(
            id: 0,
            name: '',
            email: '',
            createdAt: '',
            updatedAt: '',
          ),
        ),
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  AuthState copyWith({
    LogInResponse? response,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return AuthState(
      response: response ?? this.response,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        response,
        blocProgress,
        failureMessage,
      ];
}
