import 'package:visit_uzbekistan/widget_imports.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );

      case AppRoutes.logInPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const LogInPage(),
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
          builder: (_) => BlocProvider(
            create: (context) => SingleCityBloc(),
            child: SignleCityPage(
              id: settings.arguments as int,
            ),
          ),
        );

      case AppRoutes.singleTransportPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => SingleTransportPage(
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

      case AppRoutes.codeVerificationPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const CodeVerificationPage(),
        );

      case AppRoutes.signUpPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SignUpPage(),
        );

      case AppRoutes.signUpEnterDetails:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SignUpEnterDetailsPage(),
        );

      case AppRoutes.htmlView:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => HtmlView(
            id: settings.arguments as int,
          ),
        );

      case AppRoutes.usefullAppsPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => UsefullAppsPage(
            id: settings.arguments as int,
          ),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const LogInPage(),
        );
    }
  }
}
