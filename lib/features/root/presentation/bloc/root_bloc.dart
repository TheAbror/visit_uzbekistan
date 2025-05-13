import 'package:visit_uzbekistan/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  // void postScannerResults(String qrToke) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   final request = ScannerRequest(qrToken: qrToke);

  //   try {
  //     final response = await postQRScannerResultUseCase(request);

  //     emit(
  //       state.copyWith(
  //         success: response.success,
  //         blocProgress: BlocProgress.IS_SUCCESS,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }

  void changeTab(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
  }
}
