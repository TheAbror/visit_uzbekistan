import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class RootPageBottomAppBar extends StatelessWidget {
  const RootPageBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
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
                    state.tabIndex == 0
                        ? IconsaxPlusBold.map_1
                        : IconsaxPlusLinear.map_1,
                    size: 22.h,
                    color:
                        state.tabIndex == 0 ? AppColors.primary : Colors.grey,
                  ),
                  onPressed: () {
                    context.read<RootBloc>().changeTab(0);
                  },
                ),
                IconButton(
                  icon: Icon(
                    state.tabIndex == 1
                        ? IconsaxPlusBold.building
                        : IconsaxPlusLinear.building,
                    size: 22.h,
                    color:
                        state.tabIndex == 1 ? AppColors.primary : Colors.grey,
                  ),
                  onPressed: () {
                    context.read<RootBloc>().changeTab(1);
                  },
                ),
                IconButton(
                  icon: Icon(
                    state.tabIndex == 2
                        ? IconsaxPlusBold.task
                        : IconsaxPlusLinear.task,
                    size: 22.h,
                    color:
                        state.tabIndex == 2 ? AppColors.primary : Colors.grey,
                  ),
                  onPressed: () {
                    context.read<RootBloc>().changeTab(2);
                  },
                ),
                IconButton(
                  icon: Icon(
                    state.tabIndex == 3
                        ? IconsaxPlusBold.more
                        : IconsaxPlusLinear.more,
                    size: 22.h,
                    color:
                        state.tabIndex == 3 ? AppColors.primary : Colors.grey,
                  ),
                  onPressed: () {
                    context.read<RootBloc>().changeTab(3);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
