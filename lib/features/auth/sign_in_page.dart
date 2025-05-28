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
      appBar: AppBar(
        leading: CustomAppBarBackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.siginTextColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Start your adventure along the Silk Road — discover the wonders of Uzbekistan!',
              // 'Explore the Silk Road’s magic — unlock the wonders of Uzbekistan and start your adventure here!',
              style: TextStyle(color: AppColors.siginSecondaryTextColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            InkWell(
              onTap: () {
                print('clicked');
                signIn(context);
              },
              borderRadius: BorderRadius.circular(32),
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.siginButtonsColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/google_icon.png',
                      height: 24,
                    ),
                    Spacer(),
                    Text(context.localizations.signInWith + ' Google'),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 1,
                    color: AppColors.rootBgColor.withOpacity(0.7),
                  ),
                ),
                Text(
                  'or',
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 1,
                    color: AppColors.rootBgColor.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.siginButtonsColor,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Login',
                  isDense: true,
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.siginButtonsColor,
                ),
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.siginButtonsColor,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  isDense: true,
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.siginButtonsColor,
                ),
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPasswordPage);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.siginSecondaryTextColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            InkWell(
              onTap: () {
                print('clicked');
                // signIn(context);
              },
              borderRadius: BorderRadius.circular(32),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.siginTextColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.siginTextColor.withOpacity(0.1),
                      offset: Offset(1, 2),
                      blurRadius: 1,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: AppColors.float,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                SizedBox(width: 10.w),
                Text(
                  'Don`t have account?',
                  style: TextStyle(
                    color: AppColors.siginSecondaryTextColor,
                    fontSize: 13.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //

                    Navigator.pushNamed(context, AppRoutes.signUpPage);
                  },
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                      color: AppColors.siginTextColor,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.rootPage,
                  (route) => false,
                );
                // Navigator.pushNamed(
                //   context,
                //   AppRoutes.singleCityPage,
                //   arguments: 0,
                // );
              },
              child: Text(
                context.localizations.maybeLater,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: () async {
                // ignore: unused_local_variable
                final result = await TermsBottomSheet.show(context);
              },
              child: Text(
                context.localizations.byUsingThisApp,
                style: TextStyle(
                  color: AppColors.siginSecondaryTextColor,
                  fontSize: 10.sp,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
