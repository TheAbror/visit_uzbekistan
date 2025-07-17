import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class SignUpEnterDetailsPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SignUpEnterDetailsPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleCityPageLeadingIcon(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.rootPage);
            },
            behavior: HitTestBehavior.opaque,
            child: Text(
              context.localizations.skipStep,
              style: TextStyle(
                fontSize: 15.sp,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
