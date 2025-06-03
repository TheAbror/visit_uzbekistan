import 'package:visit_uzbekistan/widgets/widget_imports.dart';

class ForgotPasswordSuccessPage extends StatelessWidget {
  const ForgotPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInCustomAppBar(),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 32.h),
          Assets.icons.auth.forgotPasswordSuccess.image(
            height: 176.h,
            width: 228.w,
          ),
          SizedBox(height: 24.h),
          Text(
            context.localizations.passwordReset,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 32.h),
          ActionButton(
            text: context.localizations.signInNow,
            onPressed: () {
              // context.goNamed(AppRoutes.rootPage);
              // // if (formKey.currentState!.validate()) {
              // // }

              Navigator.pushNamed(context, AppRoutes.rootPage);
            },
          ),
        ],
      ),
    );
  }
}
