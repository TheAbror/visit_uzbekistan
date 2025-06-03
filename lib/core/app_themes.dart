import 'package:visit_uzbekistan/widgets/widget_imports.dart';

class ThemeProvider {
  static final darkTheme = ThemeData(
    // fontFamily: 'Montserrat',
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(color: AppColors.primary),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
      ),
    ),
    dividerColor: Colors.black12,
    colorScheme: const ColorScheme.dark(primary: AppColors.primary)
        .copyWith(surface: AppColors.backgroundColorDark),
  );

  static final lightTheme = ThemeData(
    // fontFamily: 'Montserrat',
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(color: AppColors.primary),
    // appBarTheme: const AppBarTheme(
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     systemNavigationBarColor: Colors.white, // Navigation bar
    //     statusBarColor: Colors.transparent, // Status bar
    //   ),
    // ),
    brightness: Brightness.light,
    // scaffoldBackgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: Color(0XFFEEF2F6),
    dividerColor: Colors.white54,
    sliderTheme: const SliderThemeData(
      thumbColor: AppColors.primary,
    ),
  );
}
