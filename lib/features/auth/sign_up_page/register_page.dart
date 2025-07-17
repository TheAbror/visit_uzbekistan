import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SignUpEnterDetailsPageAppBar(),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10 = context.localizations;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isRegistrationSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.rootPage,
              (route) => false,
            );
          }
          if (state.blocProgress == BlocProgress.FAILED) {
            showMessage(
              state.failureMessage,
              isError: true,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            Text(
              l10.tellUsAboutY,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              l10.firstName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            _firstNameField(context),
            SizedBox(height: 16.h),
            Text(
              l10.lastName,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            _lastNameField(context),
            SizedBox(height: 16.h),
            Text(
              l10.emailAddress,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            _loginField(context),
            SizedBox(height: 16.h),
            Text(
              context.localizations.password,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            _passwordField(context),
            SizedBox(height: 40.h),
            ActionButton(
              text: l10.continueButton,
              onPressed: () {
                context.read<AuthBloc>().register(
                      _firstName.text.trim() + ' ' + _lastName.text.trim(),
                      _email.text.trim(),
                      _password.text.trim(),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _firstNameField(BuildContext context) {
    return TextFormField(
      controller: _firstName,
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(context, ''),
    );
  }

  TextFormField _lastNameField(BuildContext context) {
    return TextFormField(
      controller: _lastName,
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(
        context,
        '',
      ),
    );
  }

  TextFormField _loginField(BuildContext context) {
    return TextFormField(
      controller: _email,
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(
        context,
        '',
      ),
    );
  }

  TextFormField _passwordField(BuildContext context) {
    return TextFormField(
      controller: _password,
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(
        context,
        '',
        // suffixicon: true,
        // suffixicon: true,
      ),
    );
  }
}
