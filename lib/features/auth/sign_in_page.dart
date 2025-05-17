import 'package:visit_uzbekistan/features/auth/widgets/terms_bottomsheet/terms_bottomsheet.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

class SignInPage extends StatefulWidget {
  static String routeName = '/sign_in';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/sign_in_bg.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/sign_in_bg.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/sign_in_bg.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  text: 'Sign in with Google',
                  onTap: () {
                    print('clicked');
                    signIn(context);
                  },
                  icon: Image.asset(
                    'assets/icons/google_icon.png',
                    height: 24,
                  ),
                ),
                SizedBox(height: 20),
                if (Platform.isIOS)
                  SignInButton(
                    text: 'Sign in with Apple',
                    onTap: () {},
                    icon: Icon(Icons.apple, size: 26),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/logo_with_text.svg',
                  height: 50,
                ),
                SizedBox(height: 20),
                Text('Some dummy text')
              ],
            ),
          ),
          Positioned(
            top: 70,
            left: 16,
            child: CustomAppBarBackButton(),
          ),
          Positioned(
            bottom: 60.h,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.rootPage,
                  (route) => false,
                );
              },
              child: Text(
                'May be later',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            child: GestureDetector(
              onTap: () async {
                // ignore: unused_local_variable
                final result = await TermsBottomSheet.show(context);
              },
              child: Text(
                'By using this app, you agree to our Terms and Conditions.',
                style: TextStyle(color: Colors.grey, fontSize: 10.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
