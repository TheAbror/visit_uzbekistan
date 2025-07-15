import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState.initial());

  // void updateData({
  //   String? login,
  //   String? password,
  // }) {
  //   if (login != null) {
  //     emit(state.copyWith(login: login));
  //   } else if (password != null) {
  //     emit(state.copyWith(password: password));
  //   }

  //   final isLoginValid = state.login.isNotEmpty;
  //   final isPasswordValid = state.password.isNotEmpty;

  //   var isFormValid = false;
  //   isFormValid = isLoginValid && isPasswordValid;

  //   emit(state.copyWith(isButtonEnabled: isFormValid));
  // }

  // void clearAll() {
  //   emit(AuthState.initial());
  // }

  void logIn(String email, String password) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = LogInRequest(
      email: email,
      password: password,
    );

    try {
      final response = await ApiProvider.authServices.logIn(request);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          ApiProvider.create(token: data.data.token);

          // boxCurrentUser.put(
          //   ShPrefKeys.currentUser,
          //   CurrentUser(
          //     fullName: fullName,
          //     shortName: shortName,
          //     token: token,
          //     userID: data.userInfo.id.toString(),
          //     roles: roles,
          //   ),
          // );

          emit(
            state.copyWith(
              response: data,
              blocProgress: BlocProgress.IS_SUCCESS,
            ),
          );
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: e.toString(),
      ));
    }
  }

  // void isPasswordHidden() {
  //   final item = !state.isPasswordHidden;
  //   emit(state.copyWith(isPasswordHidden: item));
  // }

  void register(
    String name,
    String email,
    String password,
  ) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = RegisterRequest(
      name: name,
      email: email,
      password: password,
      password_confirmation: password,
    );

    try {
      final response = await ApiProvider.authServices.register(request);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          ApiProvider.create(token: data.data.token);

          emit(
            state.copyWith(
              response: data,
              blocProgress: BlocProgress.IS_SUCCESS,
            ),
          );
        }
      } else {
        final error =
            ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: e.toString(),
      ));
    }
  }
}
