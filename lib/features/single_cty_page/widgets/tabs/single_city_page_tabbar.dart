import 'package:visit_uzbekistan/widget_imports.dart';

class SingleCityPageTabBar extends StatelessWidget {
  const SingleCityPageTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.float,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          dividerColor: Colors.transparent,
          labelColor: AppColors.float,
          unselectedLabelColor: AppColors.foregroundTertiaryRest,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.transparent,
          indicatorPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
          labelPadding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ),
          indicator: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          tabs: [
            SingleCityTab(label: 'About Samarkand'),
            SingleCityTab(label: 'Before the trip'),
            SingleCityTab(label: 'Restaurants'),
            SingleCityTab(label: 'Hotels'),
            SingleCityTab(label: 'Car rental'),
            SingleCityTab(label: 'Tours'),
            SingleCityTab(label: 'Tours1'),
            SingleCityTab(label: 'Tours2'),
          ],
        ),
      ),
    );
  }
}
