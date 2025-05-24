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
            SingleCityTab(label: 'About Urgench'),
            SingleCityTab(label: 'Before the trip'),
            SingleCityTab(label: 'Transportation'),
            SingleCityTab(label: 'Restaurants'),
            SingleCityTab(label: 'Hotels'),
            SingleCityTab(label: 'Tours'),
            SingleCityTab(label: 'Tours1'),
            SingleCityTab(label: 'Tours2'),
          ],
        ),

        //     TabBar(
        //   isScrollable: true,
        //   labelColor: Colors.redAccent,
        //   unselectedLabelColor: Colors.grey,
        //   indicatorColor: Colors.redAccent,
        //   labelPadding: EdgeInsets.only(
        //     left: 20,
        //     right: 20,
        //     bottom: 10,
        //     top: 10,
        //   ),
        //   labelStyle: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 15,
        //   ),
        //   tabs: [
        //     Text('NEWS'),
        //     Text('SUMMARY'),
        //     Text('CAREER'),
        //     Text('MATCHES'),
        //     Text('GOALS'),
        //     Text('GOALS'),
        //     Text('GOALS'),
        //     Text('GOALS'),
        //   ],
        // ),
      ),
    );
  }
}
