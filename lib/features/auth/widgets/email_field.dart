import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class EmailField extends StatefulWidget {
  final TextEditingController email;
  final AppLocalizations l10;

  const EmailField({
    super.key,
    required this.email,
    required this.l10,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.siginButtonsColor,
      ),
      child: TextField(
        controller: widget.email,
        decoration: InputDecoration(
          hintText: widget.l10.login,
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
