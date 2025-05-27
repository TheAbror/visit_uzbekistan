part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  final String? languageCode;

  const LocalizationState({
    this.languageCode,
  });

  factory LocalizationState.initial() {
    return LocalizationState();
  }

  LocalizationState copyWith({
    String? languageCode,
  }) {
    return LocalizationState(
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  List<Object?> get props => [languageCode];
}
