import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class CitiesTabSearchWidget extends StatefulWidget {
  const CitiesTabSearchWidget({
    super.key,
  });

  @override
  State<CitiesTabSearchWidget> createState() => _CitiesTabSearchWidgetState();
}

class _CitiesTabSearchWidgetState extends State<CitiesTabSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      margin: EdgeInsets.only(
        top: 12.h,
        bottom: 12.h,
        left: 8.w,
        right: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
        boxShadow: AppColors.defaultShadowForItems,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Icon(IconsaxPlusLinear.search_normal_1),
          SizedBox(width: 16.w),
          Expanded(
            child: TextField(
              onChanged: (value) {
                context.read<CitiesTabBloc>().search(value);
              },
              decoration: InputDecoration(
                hintText: context.localizations.search,
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
