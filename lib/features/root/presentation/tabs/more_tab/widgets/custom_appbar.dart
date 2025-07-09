import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String title;
  final String? subtitle;
  final double height;
  final bool withElevation;
  final bool backButton;
  final Function()? backButtonPressed;

  const CustomAppBar({
    required this.title,
    this.color = Colors.white,
    this.height = kToolbarHeight,
    this.withElevation = true,
    this.backButton = false,
    this.backButtonPressed,
    this.subtitle,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final subtitleText = subtitle;

    return Container(
      height: height + topPadding,
      color: color ?? Colors.blue,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: preferredSize.height,
        color: color,
        child: Row(
          children: [
            backButton
                ? GestureDetector(
                    onTap:
                        backButtonPressed ?? () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.only(left: 16),
                      width: 56,
                      height: 56,
                      child: const Icon(
                        Icons.chevron_left,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                  )
                : SizedBox(
                    width: 56.w,
                  ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title.length > 20
                              ? '${title.substring(0, 20)}...'
                              : title,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        if (subtitleText != null)
                          Text(
                            subtitleText.length > 20
                                ? '${subtitleText.substring(0, 20)}...'
                                : subtitleText,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade300,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              width: 56,
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
