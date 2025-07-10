part of 'root_bloc.dart';

class RootState extends Equatable {
  final bool isInternetOn;
  final bool attemptedToCheck;
  //
  final int tabIndex;
  //search functionality
  final List<SingleItemResponse> favoritesInitial;
  final List<SingleItemResponse> favoritesSearched;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.isInternetOn,
    required this.attemptedToCheck,
    required this.tabIndex,
    required this.favoritesInitial,
    required this.favoritesSearched,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      isInternetOn: false,
      attemptedToCheck: false,
      tabIndex: 0,
      favoritesInitial: [],
      favoritesSearched: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    bool? isInternetOn,
    bool? attemptedToCheck,
    int? tabIndex,
    List<SingleItemResponse>? favoritesInitial,
    List<SingleItemResponse>? favoritesSearched,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      isInternetOn: isInternetOn ?? this.isInternetOn,
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
        isInternetOn,
        attemptedToCheck,
        tabIndex,
        favoritesInitial,
        favoritesSearched,
        blocProgress,
        failureMessage,
      ];
}
