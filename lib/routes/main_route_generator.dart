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

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
