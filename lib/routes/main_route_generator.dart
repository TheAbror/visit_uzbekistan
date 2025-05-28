import 'package:visit_uzbekistan/widget_imports.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );

      case AppRoutes.signIn:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SignInPage(),
        );

      case AppRoutes.rootPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const RootPage(),
        );

      case AppRoutes.onBoardingPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const OnboardingPage(),
        );

      case AppRoutes.singleCityPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => SignleCityPage(
            id: settings.arguments as int,
          ),
        );

      case AppRoutes.singleCarPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => SingleCarPage(
            id: settings.arguments as int,
          ),
        );

      case AppRoutes.viewAllPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const ViewAllPage(),
        );

      case AppRoutes.forgotPasswordPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const ForgotPasswordPage(),
        );

      case AppRoutes.forgotPasswordNewPassordPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const ForgotPasswordNewPasswordPage(),
        );

      case AppRoutes.forgotPasswordSuccessPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const ForgotPasswordSuccessPage(),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SignInPage(),
        );
    }
  }
}
