part of 'root_bloc.dart';

class RootState extends Equatable {
  final bool isConnectedToInternet;
  final bool attemptedToCheck;
  final int tabIndex;
  //search functionality
  final List<SingleItemResponse> favoritesInitial;
  final List<SingleItemResponse> favoritesSearched;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.isConnectedToInternet,
    required this.attemptedToCheck,
    required this.tabIndex,
    required this.favoritesInitial,
    required this.favoritesSearched,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      isConnectedToInternet: false,
      attemptedToCheck: false,
      tabIndex: 0,
      favoritesInitial: [],
      favoritesSearched: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    bool? isConnectedToInternet,
    bool? attemptedToCheck,
    int? tabIndex,
    List<SingleItemResponse>? favoritesInitial,
    List<SingleItemResponse>? favoritesSearched,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      isConnectedToInternet:
          isConnectedToInternet ?? this.isConnectedToInternet,
      attemptedToCheck: attemptedToCheck ?? this.attemptedToCheck,
      tabIndex: tabIndex ?? this.tabIndex,
      favoritesInitial: favoritesInitial ?? this.favoritesInitial,
      favoritesSearched: favoritesSearched ?? this.favoritesSearched,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        isConnectedToInternet,
        attemptedToCheck,
        tabIndex,
        favoritesInitial,
        favoritesSearched,
        blocProgress,
        failureMessage,
      ];
}
