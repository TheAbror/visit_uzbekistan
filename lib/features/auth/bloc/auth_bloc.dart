import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState.initial());

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

          final user = data.data.user;

          userBox.put(
            ShPrefKeys.userBox,
            UserModel(
              id: user.id,
              name: user.name,
              email: user.email,
              createdAt: user.createdAt,
              updatedAt: user.updatedAt,
              token: data.data.token,
            ),
          );

          emit(
            state.copyWith(
              isSuccess: true,
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

  void logout() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.authServices.logout();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          hiveBox.delete(ShPrefKeys.localStorageItems);
          savedCitiesBox.delete(ShPrefKeys.localStorageSavedCity);
          userBox.delete(ShPrefKeys.userBox);

          emit(
            state.copyWith(
              isLogoutSuccess: true,
              blocProgress: BlocProgress.IS_SUCCESS,
            ),
          );
        }
      } else {
        final error = ErrorResponse.fromJson(
          json.decode(
            response.error.toString(),
          ),
        );

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

  void clearAll() {
    emit(AuthState.initial());
  }

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

  // void isPasswordHidden() {
  //   final item = !state.isPasswordHidden;
  //   emit(state.copyWith(isPasswordHidden: item));
  // }
}
