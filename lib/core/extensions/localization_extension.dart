import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}
