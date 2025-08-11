import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final bool isAnotherColor;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.text,
    this.isFilled = true,
    this.isAnotherColor = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isAnotherColor
              ? Theme.of(context).colorScheme.primary
              : AppColors.siginTextColor,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              letterSpacing: 0.5,
              fontSize: 15.sp,
              color: isFilled ? AppColors.onPrimary : AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
