import 'package:visit_uzbekistan/widget_imports.dart';

class ForgotPasswordNewPasswordPage extends StatelessWidget {
  const ForgotPasswordNewPasswordPage({super.key});

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
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            Text(
              context.localizations.newPassword,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              context.localizations.password,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              validator: (username) {
                if (username == null || username.isEmpty) {
                  return context.localizations.cantBeEmpty;
                }
                if (controller1.text != controller2.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              controller: controller1,
              textInputAction: TextInputAction.next,
              decoration: AuthFieldDecoration(
                context,
                '',
                suffixicon: true,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'context.localizations.repeatpassword',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              validator: (username) {
                if (username == null || username.isEmpty) {
                  return context.localizations.cantBeEmpty;
                }
                if (controller1.text != controller2.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              controller: controller2,
              textInputAction: TextInputAction.next,
              decoration: AuthFieldDecoration(
                context,
                '',
                suffixicon: true,
              ),
            ),
            SizedBox(height: 40.h),
            ActionButton(
              text: context.localizations.changePassword,
              onPressed: () {
                // context.read<AuthBloc>().resetPasswordToNew(controller1.text.trim());
                // }

                Navigator.pushNamed(
                    context, AppRoutes.forgotPasswordSuccessPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
