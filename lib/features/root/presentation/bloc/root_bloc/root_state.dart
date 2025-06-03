part of 'root_bloc.dart';

class RootState extends Equatable {
  final int tabIndex;
  //search functionality
  final List<SingleItemResponse> favoritesInitial;
  final List<SingleItemResponse> favoritesSearched;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.tabIndex,
    required this.favoritesInitial,
    required this.favoritesSearched,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      tabIndex: 0,
      favoritesInitial: [],
      favoritesSearched: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    int? tabIndex,
    List<SingleItemResponse>? favoritesInitial,
    List<SingleItemResponse>? favoritesSearched,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      tabIndex: tabIndex ?? this.tabIndex,
      favoritesInitial: favoritesInitial ?? this.favoritesInitial,
      favoritesSearched: favoritesSearched ?? this.favoritesSearched,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        tabIndex,
        favoritesInitial,
        favoritesSearched,
        blocProgress,
        failureMessage,
      ];
}
