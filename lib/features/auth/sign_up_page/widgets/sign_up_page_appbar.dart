import 'package:visit_uzbekistan/widget_imports.dart';

class SignUpPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBarBackButton(),
          Text(
            'context.localizations.existinguser',
            style: TextStyle(
              fontSize: 15.sp,
              color: Theme.of(context).colorScheme.surfaceTint,
              fontWeight: FontWeight.w400,
              letterSpacing: -1,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.logInPage),
            behavior: HitTestBehavior.opaque,
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 15.sp,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                letterSpacing: -1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
