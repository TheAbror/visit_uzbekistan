import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String title;
  final String? subtitle;
  final double height;
  final bool withElevation;
  final Function()? backButtonPressed;

  const CustomAppBar({
    required this.title,
    this.color = Colors.white,
    this.height = kToolbarHeight,
    this.withElevation = true,
    this.backButtonPressed,
    this.subtitle,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;

    return Container(
      height: height + topPadding,
      color: color ?? Colors.blue,
      alignment: Alignment.bottomCenter,
      child: Container(
          height: preferredSize.height,
          color: color,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
