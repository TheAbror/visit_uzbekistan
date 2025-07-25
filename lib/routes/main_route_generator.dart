import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );

      case AppRoutes.favoritesPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const FavoritesPage(),
        );

      case AppRoutes.logInPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const LogInPage(),
        );

      case AppRoutes.rootPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const RootPage(),
        );

      case AppRoutes.profilePage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => ProfilePage(),
        );

      case AppRoutes.onBoardingPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const OnboardingPage(),
        );

      case AppRoutes.singleCityPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => BlocProvider(
            create: (context) => CityBloc(),
            child: SignleCityPage(
              idandTitle: settings.arguments as IdandTitle,
            ),
          ),
        );

      case AppRoutes.transportPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => BlocProvider(
            create: (context) => TransportationBloc(),
            child: TransportPage(
              idandTitle: settings.arguments as IdandTitle,
            ),
          ),
        );

      case AppRoutes.viewAllPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => BlocProvider(
            create: (context) => ViewAllBloc(),
            child: ViewAllPage(
              pageNamed: settings.arguments as OpenPageNamed,
            ),
          ),
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

      case AppRoutes.registerPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const RegisterPage(),
        );

      case AppRoutes.articlePage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => ArticlePage(
            idandTitle: settings.arguments as IdandTitle,
          ),
        );

      case AppRoutes.usefullAppsPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => UsefullAppsPage(
            idandTitle: settings.arguments as IdandTitle,
          ),
        );

      case AppRoutes.mustKnowPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => MustKnowPage(
            idandTitle: settings.arguments as IdandTitle,
          ),
        );

      case AppRoutes.restaurantPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => BlocProvider(
            create: (context) => RestaurantBloc(),
            child: RestaurentPage(
              idandTitle: settings.arguments as IdandTitle,
            ),
          ),
        );

      case AppRoutes.placePage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => BlocProvider(
            create: (context) => PlaceBloc(),
            child: PlacePage(
              idandTitle: settings.arguments as IdandTitle,
            ),
          ),
        );

      case AppRoutes.toursPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => BlocProvider(
            create: (context) => ToursBloc(),
            child: ToursPage(
              idandTitle: settings.arguments as IdandTitle,
            ),
          ),
        );

      case AppRoutes.downloadsPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => DownloadsPage(),
        );

      case AppRoutes.singleDownloadPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => SingleDownloadedItemPage(
            idandTitle: settings.arguments as IdandTitle,
          ),
        );

      case AppRoutes.tripPlannerPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => TripPlannerPage(),
        );

      case AppRoutes.addreviewPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => AddReviewPage(),
        );

      case AppRoutes.plansTransportationPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => PlansTransportationPage(),
        );

      case AppRoutes.plansCurrencyPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => BlocProvider(
            create: (context) => PlansBloc(),
            child: PlansCurrencyPage(),
          ),
        );

      case AppRoutes.plansMapPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => PlansMapPage(),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
