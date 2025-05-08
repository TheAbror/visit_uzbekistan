import 'package:visit_uzbekistan/widget_imports.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SizedBox(), //TODO
        );

      // case AppRoutes.signIn:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const SignInPage(),
      //   );

      // case AppRoutes.homePage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const HomePage(),
      //   );

      // case AppRoutes.staffHome:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const StaffHomePage(),
      //   );

      // case AppRoutes.manageInquiry:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => ManageInquiryPage(
      //       viewModel: settings.arguments as ManageInquiryPageViewModel,
      //     ),
      //   );

      // case AppRoutes.bildirgi:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (context) => BildirgiPage(
      //       viewModel: settings.arguments as BildirgiPageViewModel,
      //     ),
      //   );

      // case AppRoutes.bildirgiNoti:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (context) => BildirgiNotiPage(
      //       id: settings.arguments as dynamic,
      //     ),
      //   );

      // case AppRoutes.faceIDSecurity:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const FaceIDSecurity(),
      //   );

      // case AppRoutes.attendaceTab:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const AttendanceTab(),
      //   );

      // case AppRoutes.editPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const EditAccountInfoPage(),
      //   );

      // case AppRoutes.libraryPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => LibraryPage(),
      //   );

      // case AppRoutes.managePasscode:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => ManagePasscodePage(),
      //   );

      // case AppRoutes.singleModulePage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => SingleModulePage(
      //       idAndTitle: settings.arguments as IDandTitle,
      //     ),
      //   );

      // case AppRoutes.abouthTheAppPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const AboutTheAppPage(),
      //   );

      // case AppRoutes.languageSelectionPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const LanguageSelectionPage(),
      //   );

      // case AppRoutes.canteenPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const CanteenPage(),
      //   );

      // case AppRoutes.shopPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const ShopPage(),
      //   );

      // case AppRoutes.profileViewInfoPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const ProfileViewInfoPage(),
      //   );

      // case AppRoutes.settingsPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const SettingsPage(),
      //   );

      // case AppRoutes.notificationsPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const NotificationsPage(),
      //   );

      // case AppRoutes.vmPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const VMPage(),
      //   );

      // case AppRoutes.paymentsPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => PaymentsPage(),
      //   );

      // case AppRoutes.topicsPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => TopicsPage(
      //       viewModel: settings.arguments as IDandTitle,
      //     ),
      //   );

      // case AppRoutes.discussionPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => DiscussionBloc(),
      //       child: DiscussionPage(
      //         viewModel: settings.arguments as IDTitleAndIsArchived,
      //       ),
      //     ),
      //   );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SizedBox(), //TODO
        );
    }
  }
}
