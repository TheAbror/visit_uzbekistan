part of 'view_all_bloc.dart';

class ViewAllState extends Equatable {
  final List<SingleItemResponse> initialList;
  final List<SingleItemResponse> searchedList;
  final BlocProgress blocProgress;
  final String failureMessage;

  const ViewAllState({
    required this.initialList,
    required this.searchedList,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory ViewAllState.initial() {
    return ViewAllState(
      initialList: [],
      searchedList: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  ViewAllState copyWith({
    List<SingleItemResponse>? initialList,
    List<SingleItemResponse>? searchedList,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return ViewAllState(
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
