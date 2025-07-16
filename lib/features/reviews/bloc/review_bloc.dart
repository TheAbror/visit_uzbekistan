import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'review_state.dart';

class ReviewBloc extends Cubit<ReviewState> {
  ReviewBloc() : super(ReviewState.initial());

  void clearAll() {
    emit(ReviewState.initial());
  }

  void addReview(
      // String name,
      // String email,
      // String password,
      ) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = ReviewRequest(
      user_id: '3',
      comment:
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
      rating: '5',
      model_id: '5',
      model_type: 'city',
    );

    try {
      final response = await ApiProvider.reviewService.addReview(request);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
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
