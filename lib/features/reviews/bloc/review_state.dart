part of 'review_bloc.dart';

class ReviewState extends Equatable {
  final List<Widget> stars;
  final int selectedStarIndex;
  final BlocProgress blocProgress;
  final String failureMessage;

  const ReviewState({
    required this.stars,
    required this.selectedStarIndex,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory ReviewState.initial() {
    return ReviewState(
      stars: [
        EmptyStar(),
        EmptyStar(),
        EmptyStar(),
        EmptyStar(),
        EmptyStar(),
      ],
      selectedStarIndex: 5,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  ReviewState copyWith({
    List<Widget>? stars,
    int? selectedStarIndex,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return ReviewState(
      stars: stars ?? this.stars,
      selectedStarIndex: selectedStarIndex ?? this.selectedStarIndex,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        stars,
        selectedStarIndex,
        blocProgress,
        failureMessage,
      ];
}
