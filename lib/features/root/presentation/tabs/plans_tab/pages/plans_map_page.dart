import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PlansMapPage extends StatelessWidget {
  const PlansMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        leading: SingleCityPageLeadingIcon(),
      ),
      body: Container(
        padding: EdgeInsets.all(8.w),
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.float),
        child: Column(
          children: [
            InteractiveViewer(
              panEnabled: false,
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 5,
              child: Image.asset('assets/map/map1.jpg'),
            ),
            SizedBox(height: 5.h),
            InteractiveViewer(
              panEnabled: false,
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 5,
              child: Image.asset('assets/map/map2.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
