import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController password;
  final AppLocalizations l10;

  const PasswordField({
    super.key,
    required this.password,
    required this.l10,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.siginButtonsColor,
      ),
      child: TextField(
        controller: widget.password,
        decoration: InputDecoration(
          hintText: widget.l10.password,
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
    );
  }
}
