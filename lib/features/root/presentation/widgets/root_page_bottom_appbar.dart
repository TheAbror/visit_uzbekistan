import 'package:visit_uzbekistan/widget_imports.dart';

class RootPageBottomAppBar extends StatelessWidget {
  final int tabIndex;

  const RootPageBottomAppBar({
    super.key,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 56.h,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 48.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                tabIndex == 0 ? IconsaxPlusBold.map_1 : IconsaxPlusLinear.map_1,
                size: 22.h,
                color: tabIndex == 0 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(0);
              },
            ),
            IconButton(
              icon: Icon(
                tabIndex == 1
                    ? IconsaxPlusBold.building
                    : IconsaxPlusLinear.building,
                size: 22.h,
                color: tabIndex == 1 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(1);
              },
            ),
            IconButton(
              icon: Icon(
                tabIndex == 2 ? IconsaxPlusBold.task : IconsaxPlusLinear.task,
                size: 22.h,
                color: tabIndex == 2 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(2);
              },
            ),
            IconButton(
              icon: Icon(
                tabIndex == 3 ? IconsaxPlusBold.more : IconsaxPlusLinear.more,
                size: 22.h,
                color: tabIndex == 3 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                context.read<RootBloc>().changeTab(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
