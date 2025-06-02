part of 'root_bloc.dart';

class RootState extends Equatable {
  final int tabIndex;
  final List<SingleItemResponse> favorites; //TODO show favorites somewhere
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.tabIndex,
    required this.favorites,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      tabIndex: 0,
      favorites: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    int? tabIndex,
    List<SingleItemResponse>? favorites,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      tabIndex: tabIndex ?? this.tabIndex,
      favorites: favorites ?? this.favorites,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        tabIndex,
        favorites,
        blocProgress,
        failureMessage,
      ];
}
