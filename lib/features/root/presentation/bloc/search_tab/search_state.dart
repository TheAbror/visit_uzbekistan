part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<String> initialList;
  final List<String> searchedList;
  final BlocProgress blocProgress;
  final String failureMessage;

  const SearchState({
    required this.initialList,
    required this.searchedList,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory SearchState.initial() {
    return SearchState(
      initialList: [],
      searchedList: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  SearchState copyWith({
    List<String>? initialList,
    List<String>? searchedList,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return SearchState(
      initialList: initialList ?? this.initialList,
      searchedList: searchedList ?? this.searchedList,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        initialList,
        searchedList,
        blocProgress,
        failureMessage,
      ];
}
