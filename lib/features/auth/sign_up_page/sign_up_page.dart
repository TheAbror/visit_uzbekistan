import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInCustomAppBar(),
      body: _Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _formKey = GlobalKey<FormState>();
  final _login = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            Text(
              context.localizations.createYourAccount,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 40.h),

            _loginField(context),
            SizedBox(height: 24.h),

            ActionButton(
              text: context.localizations.signUp,
              onPressed: () {
                // final login = _login.text.trim();

                Navigator.pushNamed(context, AppRoutes.signUpEnterDetails);
              },
            ),
            // DividerWithOrText(),
            // ContinueWithGoogleButton(),
          ],
        ),
      ),
    );
  }

  TextFormField _loginField(BuildContext context) {
    return TextFormField(
      validator: (username) {
        if (username == null || username.isEmpty) {
          return context.localizations.cantBeEmpty;
        }

        if (RegExp(r'^\d').hasMatch(username)) {
          if (!username.startsWith('998')) {
            return 'context.localizations.numberShouldStart';
          }
        } else {
          // if (!emailRegEx.hasMatch(username)) {
          //   return context.localizations.pleaseEnterValidEmail;
          // }
        }

        return null;
      },
      controller: _login,
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(context, context.localizations.email),
    );
  }
}
