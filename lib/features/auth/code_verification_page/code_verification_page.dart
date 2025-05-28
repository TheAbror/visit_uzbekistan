import 'dart:async';

import 'package:visit_uzbekistan/widget_imports.dart';

class CodeVerificationPage extends StatefulWidget {
  // final bool isForgorPassword;

  const CodeVerificationPage({
    super.key,
    // required this.isForgorPassword,
  });

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer(context);
  }

  void startTimer(BuildContext context) {
    // final state = context.read<AuthBloc>().state;
    // _timer = Timer.periodic(
    //   Duration(seconds: 1),
    //   (timer) {
    //     if (state.timerSeconds > 0) {
    //       context.read<AuthBloc>().decrementTimerSeconds();
    //     } else {
    //       _timer.cancel();
    //     }
    //   },
    // );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInCustomAppBar(
        func: () {
          // context.read<AuthBloc>().setInitialValue();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),

            Text(
              'context.localizations.entercode',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'context.localizations.wehavesentyoucodeto',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 4.h),
                Text('+ 998991234567'),
              ],
            ),
            SizedBox(height: 40.h),

            // OtpTextField(
            //   fieldWidth: 44.w,
            //   contentPadding: EdgeInsets.all(11.w),
            //   numberOfFields: 4,
            //   borderColor: Theme.of(context).colorScheme.primary,
            //   showFieldAsBox: true,
            //   onCodeChanged: (String code) {},
            //   onSubmit: (String verificationCode) {
            //     context.read<AuthBloc>().verificationSuccess(true);
            //   }, // end onSubmit
            // ),
            SizedBox(height: 32.h),

            // state.isVerificationSuccess
            //     ?
            Center(
              child: Assets.icons.auth.tickCircle.image(),
            ),
            // :
            // state.isCountDownFinished
            //     ?
            GestureDetector(
              onTap: () {
                // if (state.isCountDownFinished) {
                //   startTimer(context);
                //   context.read<AuthBloc>().setInitialValue();
                // }
              },
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Text(
                  'Resend code',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            //     :

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('context.localizations.resetafter'),
            //     Text('state.timerSeconds.toString()'),
            //     Text('context.localizations.seconds'),
            //   ],
            // ),
            SizedBox(height: 32.h),

            ActionButton(
              text: 'Skip for now',
              onPressed: () {
                Navigator.pushNamed(
                    context, AppRoutes.forgotPasswordNewPassordPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
