import 'package:intl/intl.dart';

extension NullableStringExtensions on String? {
  bool get isNotNullAndNotEmpty {
    final value = this;

    if (value != null && value.isNotEmpty) {
      return true;
    }

    return false;
  }
}

extension StringExtensions on String {
  String splitLangCodeFromLocale() {
    return split('_').first;
  }
}

extension StringMakeFirstCap on String {
  String makeFirstCapital() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

String getLanguageName(String languageCode) {
  switch (languageCode) {
    case 'uz':
      return 'O’zbek';
    case 'ru':
      return 'Русский';
    case 'en':
      return 'English';
    default:
      return 'Русский';
  }
}

String getLanguageCode(String languageCode) {
  switch (languageCode) {
    case 'O’zbek':
      return 'uz';
    case 'Русский':
      return 'ru';
    case 'English':
      return 'en';
    default:
      return 'ru';
  }
}

extension HumanReadableDate on String? {
  String get humanReadable {
    if (this == null || this!.isEmpty) return 'Invalid Date';

    try {
      final dateToFormat = DateTime.parse(this!).toLocal();
      return DateFormat('dd-MMMM-yyyy, HH:mm').format(dateToFormat);
    } catch (e) {
      return 'Invalid Date';
    }
  }
}
