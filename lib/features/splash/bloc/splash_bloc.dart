import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState.initial());

  void assignToken() {
    final isValid =
        savedUserData?.token != null && savedUserData?.token.isNotEmpty == true;

    if (isValid) emit(state.copyWith(token: savedUserData?.token));
  }
}
