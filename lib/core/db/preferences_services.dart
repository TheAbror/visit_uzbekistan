import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PreferencesServices {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences _getPrefs() {
    final pref = _prefs;
    if (pref != null) {
      return pref;
    } else {
      throw Exception('SharedPreferences is not inited');
    }
  }

  static void dispose() => _prefs = null;

  static String? getLangCode() {
    return _getPrefs().getString(ShPrefKeys.langCode);
  }

  static Future<bool> saveLangCode(String langCode) async {
    return _getPrefs().setString(ShPrefKeys.langCode, langCode);
  }
}
