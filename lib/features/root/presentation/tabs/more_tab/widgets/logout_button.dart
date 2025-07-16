import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLogoutSuccess) {
          clearData(context);
        } else if (state.blocProgress == BlocProgress.FAILED) {
          showMessage('Logout failed', isError: true);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          final bool? logout = await logoutDialog(context);

          final UserModel? hive = userBox.get(ShPrefKeys.userBox);

          final isValid = hive?.token != null && hive?.token.isNotEmpty == true;

          if (!isValid) {
            clearData(context);
          }

          if (logout == true) {
            context.read<AuthBloc>().logout();
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(IconsaxPlusLinear.logout_1),
              SizedBox(width: 8.w),
              Text(
                context.localizations.logout,
                style: TextStyle(
                  color: AppColors.textColorDarkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void clearData(BuildContext context) {
  ApiProvider.create();
  context.read<RootBloc>().clearAll();
  context.read<AuthBloc>().clearAll();
  context.read<CitiesTabBloc>().clearAll();
  context.read<LocalizationBloc>().clearAll();

  Navigator.pushNamedAndRemoveUntil(
    context,
    AppRoutes.splashPage,
    (route) => false,
  );
}
