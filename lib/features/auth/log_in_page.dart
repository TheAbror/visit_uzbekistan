import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class LogInPage extends StatefulWidget {
  static String routeName = '/sign_in';

  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    final l10 = context.localizations;

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
              l10.login,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.siginTextColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              l10.startYourAdventure,
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
                Text(l10.or),
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
                  hintText: l10.login,
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
                  hintText: l10.password,
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
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPasswordPage);
                  },
                  child: Text(
                    l10.forgotPassword,
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
                    l10.login,
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
                  l10.dontHaveAccount,
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
                    ' ' + l10.signUp,
                    style: TextStyle(
                      color: AppColors.siginTextColor,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.rootPage,
                  (route) => false,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.siginTextColor,
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.siginTextColor.withOpacity(0.1),
                      offset: Offset(1, 2),
                      blurRadius: 1,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  context.localizations.maybeLater,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.float,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: () async {
                final result = await TermsBottomSheet.show(context);
                print(result);
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
