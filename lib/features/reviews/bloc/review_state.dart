part of 'review_bloc.dart';

class ReviewState extends Equatable {
  final BlocProgress blocProgress;
  final String failureMessage;

  const ReviewState({
    required this.blocProgress,
    required this.failureMessage,
  });

  factory ReviewState.initial() {
    return ReviewState(
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  ReviewState copyWith({
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return ReviewState(
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        blocProgress,
        failureMessage,
      ];
}
