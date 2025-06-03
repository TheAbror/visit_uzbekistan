import 'package:visit_uzbekistan/widgets/widget_imports.dart';

Future<dynamic> signOutDialog(BuildContext context) {
  return showPlatformDialog(
    context: context,
    builder: (myContext) => BasicDialogAlert(
      title: Text('context.localizations.signOut'),
      content: Text('context.localizations.doYouWannaSignOut'),
      actions: <Widget>[
        BasicDialogAction(
          title: Text(
            'context.localizations.yes',
            style: TextStyle(color: AppColors.primary),
          ),
          onPressed: () {
            // final deviceToken = PreferencesServices.getFirebaseToken();
            // context
            //     .read<NotificationsBloc>()
            //     .deleteFirebaseToken(deviceToken ?? '');

            // context.read<NotificationsBloc>().deleteToken();

            // PreferencesServices.clearAll().then((value) async {
            //   if (value) {
            //     ApiProvider.create();
            //     boxCurrentUser.clear();
            //     if (!context.mounted) return;

            // context.read<AuthBloc>().clearAll();
            // context.read<SplashBloc>().clearAll();
            // context.read<ProfileBloc>().clearAll();
            // context.read<InquiryBloc>().clearAll();
            // context.read<DashboardBloc>().clearAll();
            // context.read<LocalizationBloc>().clearAll();
            // context.read<TimetableBloc>().clearAll();
            // context.read<MarksBloc>().clearAll();
            // context.read<AttendanceBloc>().clearAll();

            //     PreferencesServices.saveFirebaseToken('');

            //     await Navigator.of(myContext).pushNamedAndRemoveUntil(
            //       AppRoutes.languageSelectionPage,
            //       (route) => false,
            //     );
            //   }
            // });
          },
        ),
        BasicDialogAction(
          title: Text(
            'context.localizations.no',
            style: TextStyle(color: AppColors.primary),
          ),
          onPressed: () => Navigator.pop(myContext),
        ),
      ],
    ),
  );
}
