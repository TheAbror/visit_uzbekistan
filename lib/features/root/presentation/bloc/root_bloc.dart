import 'package:visit_uzbekistan/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void changeTab(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
  }
}
