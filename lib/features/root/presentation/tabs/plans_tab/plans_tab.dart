import 'package:visit_uzbekistan/widget_imports.dart';

class PlansTab extends StatelessWidget {
  const PlansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: AppColors.float,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                TitleAndViewAllWidget(title: 'Valyuta kursi'),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: AppColors.usefulAppsBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('USD'),
                          Spacer(),
                          Text('12770'),
                          SizedBox(width: 4.w),
                          Text('12820'),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text('EUR'),
                          Spacer(),
                          Text('14250'),
                          SizedBox(width: 4.w),
                          Text('14530'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text('''
              Plan (instead of Profile)
              
              Help travelers plan ahead for their trip.
              
              Sections:
              
              Create or manage an itinerary
              
              Currency exchange tips
              
              Safety & cultural do’s and don’ts
              
              Tax refund info
              
              Travel tips & must-know essentials
              
              '''),
        ],
      ),
    );
  }
}
