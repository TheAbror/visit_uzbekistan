import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState.initial());

  void clearAll() {
    emit(SplashState.initial());
  }

  void assignToken() {
    final UserModel? hive = userBox.get(ShPrefKeys.userBox);

    final isValid = hive?.token != null && hive?.token.isNotEmpty == true;

    if (isValid) emit(state.copyWith(token: hive?.token));
  }
}
