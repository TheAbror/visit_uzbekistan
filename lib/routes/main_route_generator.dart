import 'package:visit_uzbekistan/features/root/presentation/pages/view_all_page.dart';
import 'package:visit_uzbekistan/features/single_cty_page/single_city_page.dart';
import 'package:visit_uzbekistan/features/single_cty_page/tabs/transportation_tab/single_car_page.dart/single_car_page.dart';
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

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SignInPage(),
        );
    }
  }
}
