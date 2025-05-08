import 'package:visit_uzbekistan/widget_imports.dart';

class PrimaryButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final bool? isActive;
  final bool? outlineStyle;
  final double? height;
  final double? borderRadius;

  const PrimaryButton({
    this.child,
    this.onPressed,
    this.isActive = true,
    this.outlineStyle = false,
    this.height = 64,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all<Color>(
          isActive == true
              ? outlineStyle == true
                  ? Colors.transparent
                  : AppColors.primary
              : Colors.grey,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          isActive == true
              ? outlineStyle == true
                  ? Colors.transparent
                  : AppColors.primary
              : Colors.grey,
        ),
        minimumSize: WidgetStateProperty.all(const Size.fromHeight(48)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12.r,
            ),
            side: BorderSide(
              width: outlineStyle == true ? 2 : 0,
              color: isActive == true ? AppColors.primary : Colors.grey,
            ),
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: height,
        child: child,
      ),
    );
  }
}
