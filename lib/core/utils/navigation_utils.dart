import 'package:visit_uzbekistan/widget_imports.dart';

class NavigationUtils {
  static void navigateToNextRouteByAccountType(
    BuildContext context,
    AccountType accountType,
    String? passcode,
  ) {
    var passcodePage = Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.managePasscode, (route) => false);
    switch (accountType) {
      case AccountType.superAdmin:
      case AccountType.director:
        passcode != null
            ? passcodePage
            : Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.staffHome,
                (route) => false,
              );
        break;
      case AccountType.staff:
        passcode != null
            ? passcodePage
            : Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.staffHome, (route) => false);
        break;
      case AccountType.student:
        passcode != null
            ? passcodePage
            : Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.homePage, (route) => false);
        break;

      // to be deleted
      case AccountType.unknown:
        passcode != null
            ? passcodePage
            : Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.staffHome, (route) => false);
        break;
      //
      // ignore: unreachable_switch_default
      default:
        showMessage(
          'You must have either student or director role',
          isError: true,
        );
        break;
    }
  }
}
