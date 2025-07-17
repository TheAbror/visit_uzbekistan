import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class PlansTransportationPage extends StatelessWidget {
  const PlansTransportationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transportation options'),
        leading: SingleCityPageLeadingIcon(),
      ),
      body: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.float,
          // borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Text(
              'Air',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(height: 4.h),
            TransportationOption(
              id: 5,
              text: 'Uzbekistan Airways',
              icon:
                  'https://play-lh.googleusercontent.com/PEYeJu-CAK-V-3QHC3l7Lqwzwe7xPyRV-5PBqBgBmfL4fiUI0yQGcOklv2fMQGzo3w=w480-h960-rw',
            ),
            TransportationOption(
              id: 6,
              text: 'Silkavia',
              icon:
                  'https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/fe/fd/f5/fefdf5f0-7e4b-5f70-7325-409d55c5fb94/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/460x0w.webp',
            ),
            SizedBox(height: 8.h),
            Text(
              'Train',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(height: 4.h),
            TransportationOption(
              id: 4,
              text: 'Uzrailways',
              icon:
                  'https://play-lh.googleusercontent.com/Tt2MVvVqNqUc5ytsZv7D0pyvBnzTuEmlbt8KFvxOt5PFRHVzKyaIRU1SPlH8hRswTqs=w480-h960-rw',
            ),
          ],
        ),
      ),
    );
  }
}
