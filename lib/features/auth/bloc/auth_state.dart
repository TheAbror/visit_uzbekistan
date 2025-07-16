part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLogoutSuccess;
  final bool isSuccess;
  final LogInResponse response;
  final BlocProgress blocProgress;
  final String failureMessage;

  const AuthState({
    required this.isLogoutSuccess,
    required this.isSuccess,
    required this.response,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory AuthState.initial() {
    return AuthState(
      isLogoutSuccess: false,
      isSuccess: false,
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
    bool? isLogoutSuccess,
    bool? isSuccess,
    LogInResponse? response,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return AuthState(
      isLogoutSuccess: isLogoutSuccess ?? this.isLogoutSuccess,
      isSuccess: isSuccess ?? this.isSuccess,
      response: response ?? this.response,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLogoutSuccess,
        isSuccess,
        response,
        blocProgress,
        failureMessage,
      ];
}
