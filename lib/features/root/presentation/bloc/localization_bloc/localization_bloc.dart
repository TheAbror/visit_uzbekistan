import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'localization_state.dart';

class LocalizationBloc extends Cubit<LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initial());

  Future<void> initLocalization() async {
    final deviceLang = Platform.localeName.splitLangCodeFromLocale();
    print(deviceLang.makeFirstCapital());

    final userLang = PreferencesServices.getLangCode() ?? deviceLang;

    emit(state.copyWith(languageCode: userLang));

    final UserModel? hive = userBox.get(ShPrefKeys.userBox);

    final isValid = hive?.token != null && hive?.token.isNotEmpty == true;

    if (isValid) ApiProvider.create(token: hive?.token, language: userLang);
  }

  Future<void> changeLocalization(String? languageCode) async {
    final deviceLang = Platform.localeName.splitLangCodeFromLocale();

    final currentAppLang = languageCode ?? deviceLang;
    emit(state.copyWith(languageCode: currentAppLang));

    PreferencesServices.saveLangCode(currentAppLang);

    final UserModel? hive = userBox.get(ShPrefKeys.userBox);

    final isValid = hive?.token != null && hive?.token.isNotEmpty == true;

    if (isValid)
      ApiProvider.create(token: hive?.token, language: currentAppLang);
  }

  void clearAll() {
    emit(LocalizationState.initial());
  }
}
