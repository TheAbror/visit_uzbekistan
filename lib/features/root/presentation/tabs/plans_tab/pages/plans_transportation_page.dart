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
            SizedBox(height: 8.h),
            Text(
              'Taxi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(height: 4.h),
            TransportationOption(
              id: 7,
              text: 'Yandex Go',
              icon:
                  'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/c8/97/26/c897263f-2f49-5347-0428-2b38b49b5750/AppIcon-0-0-1x_U007emarketing-0-6-0-0-85-220.png/460x0w.webp',
            ),
            TransportationOption(
              id: 8,
              text: 'Uklon',
              icon:
                  'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/00/72/30/0072309e-9b8a-dd6d-69f5-d6c087da43c2/AppIcon-0-0-1x_U007epad-0-1-85-220.png/460x0w.webp',
            ),
            SizedBox(height: 8.h),
            Text(
              'Bus schedules',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(height: 4.h),
            TransportationOption(
              id: 2,
              text: 'Yandex Maps',
              icon:
                  'https://play-lh.googleusercontent.com/DLCdDuCkVMI-vQhbNmPJU8cIDZulGHJxYGz_Cm9Mbrv6ssl9TW-RUMXfzczd9NKZj4w',
            ),
            SizedBox(height: 8.h),
            Text(
              'Metro (Tashkent)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(height: 4.h),
            TransportationOption(
              id: 9,
              text: 'Yandex Metro',
              icon:
                  'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/5b/0c/82/5b0c8233-5b19-f755-eb18-01976bc56a5a/AppIcon-0-0-1x_U007emarketing-0-8-0-85-220.png/460x0w.webp',
            ),
          ],
        ),
      ),
    );
  }
}
