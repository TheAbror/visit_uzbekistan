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

extension StringReplaceBiBiCode on String {
  String replaceBiBiCode() {
    return replaceAll('<h3 style="text-align: justify"><sup>', '')
        .replaceAll('</sup>', '')
        .replaceAll('<h3>', '')
        .replaceAll('</h3>', '')
        .replaceAll('<h4>', '')
        .replaceAll('</h4>', '')
        .replaceAll('<p>', '')
        .replaceAll('</p>', '')
        .replaceAll('<br>', '')
        .replaceAll('</br>', '')
        .replaceAll('<strong>', '')
        .replaceAll('</strong>', '')
        .replaceAll('<em>', '')
        .replaceAll('</em>', '')
        .replaceAll('<u>', '')
        .replaceAll('</u>', '')
        .replaceAll('<p style="text-align: justify">', '')
        .replaceAll('</p>', '')
        .replaceAll('<p style="text-align: center">', '')
        .replaceAll('</p>', '')
        .replaceAll('<ul><li>', '')
        .replaceAll('</li></ul>', '')
        .replaceAll('&nbsp;', '')
        .replaceAll('</li></li>', '')
        .replaceAll('</p></li><li><p>', '')
        .replaceAll(')</p></li><li><p>', ') ')
        .replaceAll(')</li><li>', ') ');
  }
}

extension HumanReadableDate on int? {
  String get humanReadable {
    if (this == null) return 'Invalid Date';

    // Convert int (milliseconds since epoch) to DateTime
    final dateToFormat = DateTime.fromMillisecondsSinceEpoch(this!);

    // Format the date
    return DateFormat('dd-MMMM-yyyy, HH:mm').format(dateToFormat);
  }
}
