import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'plans_state.dart';

class PlansBloc extends Cubit<PlansState> {
  PlansBloc() : super(PlansState.initial());

  void calculator(int value) {
    emit(state.copyWith(value: value * 12720));

    print(state.value);
  }
}
