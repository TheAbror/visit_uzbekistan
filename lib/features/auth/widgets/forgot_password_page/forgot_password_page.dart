import 'package:visit_uzbekistan/widget_imports.dart';

class SignInCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Function? func;

  const SignInCustomAppBar({
    super.key,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CustomAppBarBackButton()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final TextEditingController _emailController =
      TextEditingController(text: 'qwerty@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Text(
            'context.localizations.enteryouremailorphone',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'context.localizations.wellsendyou',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 40.h),
          TextFormField(
            validator: (username) {
              if (username == null || username.isEmpty) {
                return 'context.localizations.cantbeempty';
              }

              if (RegExp(r'^\d').hasMatch(username)) {
                if (!username.startsWith('998')) {
                  return 'context.localizations.numberShouldStart';
                }
              }
              // else {
              //   if (!emailRegEx.hasMatch(username)) {
              //     return context.localizations.pleaseEnterValidEmail;
              //   }
              // }

              return null;
            },
            controller: _emailController,
            textInputAction: TextInputAction.next,
            decoration: AuthFieldDecoration(
              context,
              'Email or Phone number',
            ),
          ),
          SizedBox(height: 24.h),
          ActionButton(
            text: context.localizations.signIn,
            onPressed: () {
              // context.read<AuthBloc>().getVerificationCodeBySendingLogin(_emailController.text);

              Navigator.pushNamed(
                  context, AppRoutes.forgotPasswordNewPassordPage);
            },
          ),
        ],
      ),
    );
  }
}

InputDecoration AuthFieldDecoration(
  BuildContext context,
  String hintText, {
  bool suffixicon = false,
}) {
  return InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.w),
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: AppColors.border.withOpacity(0.2), width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red, width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red, width: 2.w),
      borderRadius: BorderRadius.circular(12.r),
    ),
    fillColor: Theme.of(context).colorScheme.surfaceTint,
    hintText: hintText,
    suffixIcon:
        // suffixicon
        //     ? BlocBuilder<AuthBloc, AuthState>(
        //         builder: (context, state) {
        //           return InkWell(
        //             onTap: () {
        //               context.read<AuthBloc>().isPasswordHidden();
        //             },
        //             child: state.isPasswordHidden
        //                 ? Icon(
        //                     Icons.visibility_outlined,
        //                     size: 20.sp,
        //                     color: Theme.of(context).colorScheme.primary,
        //                   )
        //                 :

        Icon(
      Icons.visibility_off_outlined,
      size: 20.sp,
      color: Theme.of(context).colorScheme.primary,
    ),
    // );
    // },
    // )
    // : SizedBox(),
  );
}
