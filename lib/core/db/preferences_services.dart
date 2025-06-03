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

  static String? getFirebaseToken() {
    return _getPrefs().getString(ShPrefKeys.firebaseToken);
  }

  static Future<bool> saveFirebaseToken(String token) async {
    return _getPrefs().setString(ShPrefKeys.firebaseToken, token);
  }

  //

  static String? getLangCode() {
    return _getPrefs().getString(ShPrefKeys.langCode);
  }

  static Future<bool> saveLangCode(String langCode) async {
    return _getPrefs().setString(ShPrefKeys.langCode, langCode);
  }

  static int? getAcademicYearResponseId() {
    return _getPrefs().getInt(ShPrefKeys.academicYearResponseID);
  }

  static Future<bool> saveAcademicYearResponseId(int id) async {
    return _getPrefs().setInt(ShPrefKeys.academicYearResponseID, id);
  }

  static int? getInstitutionId() {
    return _getPrefs().getInt(ShPrefKeys.institutionID);
  }

  static Future<bool> saveInstitutionId(int id) async {
    return _getPrefs().setInt(ShPrefKeys.institutionID, id);
  }

  //new ones goes above this line

  static String? getPasscode() {
    return _getPrefs().getString(ShPrefKeys.passcode);
  }

  static Future<String> savePasscode(String passcode) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(ShPrefKeys.passcode, passcode);
    return passcode;
  }

  static Future<bool> saveIsPasscodeOn(bool passcode) async {
    return _getPrefs().setBool(ShPrefKeys.passcode, passcode);
  }

  static Future<bool> removePasscode() async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.remove(ShPrefKeys.passcode);
  }

  static Future<void> saveUserRoles(List<String> roles) async {
    await _getPrefs().setStringList(ShPrefKeys.userRoles, roles);
  }

  static Future<List<String>> getUserRoles() async {
    return _getPrefs().getStringList(ShPrefKeys.userRoles) ?? [];
  }

  static AccountType getAccountType() {
    final accountTypeStr = _getPrefs().getString(ShPrefKeys.userAccountType);

    if (accountTypeStr == null) {
      return AccountType.unknown;
    }

    return AccountType.values.firstWhere(
      (AccountType accountType) => accountType.name == accountTypeStr,
    );
  }

  static Future<bool> saveAccountType(AccountType accountType) async {
    return await _getPrefs()
        .setString(ShPrefKeys.userAccountType, accountType.name);
  }

  //APP VERSION
  static Future<int?> getMinimumAppVersion() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(ShPrefKeys.minAppVersion);
  }

  static Future<bool> saveMinimumAppVersion(int minAppVersion) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setInt(ShPrefKeys.minAppVersion, minAppVersion);
  }

  static Future<int?> getLatestAppVersion() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(ShPrefKeys.latestAppVersion);
  }

  static Future<bool> saveLatestAppVersion(int latestAppVersion) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setInt(ShPrefKeys.latestAppVersion, latestAppVersion);
  }

  static Future<bool?> getShowMaintenance() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(ShPrefKeys.showMaintenance);
  }

  static Future<bool?> saveShowMaintenance(bool showMaintenance) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(ShPrefKeys.showMaintenance, showMaintenance);
  }

  static Future<String?> getAppVersionTitle() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.appVersionTitle);
  }

  static Future<bool?> saveAppVersionTitle(String appVersionTitle) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(ShPrefKeys.appVersionTitle, appVersionTitle);
  }

  static Future<String?> getAppVersionDescription() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.appVersionDescription);
  }

  static Future<bool?> saveAppVersionDescription(
      String appVersionDescription) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(
        ShPrefKeys.appVersionDescription, appVersionDescription);
  }

  static Future<String?> getAndroidStoreUrl() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.androidStoreUrl);
  }

  static Future<bool?> saveAndroidStoreUrl(String androidStoreUrl) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(ShPrefKeys.androidStoreUrl, androidStoreUrl);
  }

  static Future<String?> getIOSstoreUrl() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.iosStoreUrl);
  }

  static Future<bool?> saveIOSstoreUrl(String iosStoreUrl) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(ShPrefKeys.iosStoreUrl, iosStoreUrl);
  }

  static Future<bool> saveisLightMode(bool theme) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(ShPrefKeys.isLightMode, theme);
  }

  static Future<bool?> getisLightMode() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(ShPrefKeys.isLightMode);
  }

  static Future<bool> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }
}
