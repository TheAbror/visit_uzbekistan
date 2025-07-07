part of 'root_bloc.dart';

class RootState extends Equatable {
  final bool isConnectedToInternet;
  final bool hasInternetConnectionBeenChecked;
  final int tabIndex;
  //search functionality
  final List<SingleItemResponse> favoritesInitial;
  final List<SingleItemResponse> favoritesSearched;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.isConnectedToInternet,
    required this.hasInternetConnectionBeenChecked,
    required this.tabIndex,
    required this.favoritesInitial,
    required this.favoritesSearched,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      isConnectedToInternet: false,
      hasInternetConnectionBeenChecked: false,
      tabIndex: 0,
      favoritesInitial: [],
      favoritesSearched: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    bool? isConnectedToInternet,
    bool? hasInternetConnectionBeenChecked,
    int? tabIndex,
    List<SingleItemResponse>? favoritesInitial,
    List<SingleItemResponse>? favoritesSearched,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      isConnectedToInternet:
          isConnectedToInternet ?? this.isConnectedToInternet,
      hasInternetConnectionBeenChecked: hasInternetConnectionBeenChecked ??
          this.hasInternetConnectionBeenChecked,
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
        hasInternetConnectionBeenChecked,
        tabIndex,
        favoritesInitial,
        favoritesSearched,
        blocProgress,
        failureMessage,
      ];
}
