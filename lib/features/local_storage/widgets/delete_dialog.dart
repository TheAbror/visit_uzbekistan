import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

Future<bool?> deleteDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.only(bottom: 24.h),
            child: Material(
              borderRadius: BorderRadius.circular(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      bottom: 16.h,
                      right: 24.w,
                      left: 24.w,
                    ),
                    child: Text(
                      'Are you sure you want to delete all saved data?',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        DialogAction(
                          width: double.infinity,
                          text: 'Yes',
                          textColor: AppColors.float,
                          onTap: () => Navigator.pop(context, true),
                          backgroundColor: AppColors.primary,
                        ),
                        SizedBox(height: 8.w),
                        DialogAction(
                          width: double.infinity,
                          text: 'No',
                          textColor: AppColors.primary,
                          onTap: () => Navigator.pop(context, false),
                          backgroundColor: AppColors.buttonDisabled,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<bool?> logoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.only(bottom: 24.h),
            child: Material(
              borderRadius: BorderRadius.circular(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      bottom: 16.h,
                      right: 24.w,
                      left: 24.w,
                    ),
                    child: Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        DialogAction(
                          width: double.infinity,
                          text: 'Yes',
                          textColor: AppColors.float,
                          onTap: () => Navigator.pop(context, true),
                          backgroundColor: AppColors.primary,
                        ),
                        SizedBox(height: 8.w),
                        DialogAction(
                          width: double.infinity,
                          text: 'No',
                          textColor: AppColors.primary,
                          onTap: () => Navigator.pop(context, false),
                          backgroundColor: AppColors.buttonDisabled,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
