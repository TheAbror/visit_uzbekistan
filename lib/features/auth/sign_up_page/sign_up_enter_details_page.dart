import 'package:visit_uzbekistan/widget_imports.dart';

class SignUpEnterDetailsPage extends StatelessWidget {
  const SignUpEnterDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  //  final TextEditingController _login;

  @override
  void initState() {
    super.initState();

    // final state = context.read<AuthBloc>().state;

    // _login = TextEditingController(text: state.emailOrPhone);
  }

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10 = context.localizations;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
              // final firstName = _firstName.text.trim();
              // final lastName = _lastName.text.trim();
              // final login = _login.text;
              // final password = _password.text.trim();

              // if (_formKey.currentState!.validate()) {
              //   context.read<AuthBloc>().signUp(
              //         firstName,
              //         lastName,
              //         login,
              //         password,
              //       );
              // }

              Navigator.pushNamed(context, AppRoutes.rootPage);
            },
          ),
        ],
      ),
    );
  }

  TextFormField _firstNameField(BuildContext context) {
    return TextFormField(
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Cannot be empty';
        }

        return null;
      },
      controller: _firstName,
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(context, ''),
    );
  }

  TextFormField _lastNameField(BuildContext context) {
    return TextFormField(
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Can not be empty';
        }

        return null;
      },
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
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Can not be empty';
        }
        if (username.length < 5) {
          return 'At least 5 characters required';
        }

        if (RegExp(r'^\d').hasMatch(username)) {
          if (!username.startsWith('998')) {
            return 'Number should start with 998';
          }
        }
        // else {
        //   if (!emailRegEx.hasMatch(username)) {
        //     return 'Please enter a valid email';
        //   }
        // }
        return null;
      },
      controller: TextEditingController(),
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(
        context,
        '',
      ),
    );
  }

  TextFormField _passwordField(BuildContext context) {
    return TextFormField(
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Can not be empty';
        }
        if (username.length < 5) {
          return 'At least 5 characters required';
        }
        return null;
      },
      controller: _password,
      textInputAction: TextInputAction.next,
      decoration: AuthFieldDecoration(
        context,
        '',
        suffixicon: true,
      ),
    );
  }
}
