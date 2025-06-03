import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class TitleAndViewAllWidget extends StatelessWidget {
  final String title;
  final OpenPageNamed openPageNamed;

  const TitleAndViewAllWidget({
    super.key,
    required this.title,
    this.openPageNamed = OpenPageNamed.singleCity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.viewAllPage,
                arguments: openPageNamed,
              );
            },
            child: Text(
              context.localizations.viewAll,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
