import 'package:visit_uzbekistan/widgets/widget_imports.dart';

class ThingsToDoItem extends StatelessWidget {
  final String svgPicture;
  final String title;
  final String subTitle;
  final bool isLast;
  final bool isDone;

  const ThingsToDoItem({
    super.key,
    required this.svgPicture,
    required this.title,
    required this.subTitle,
    this.isLast = false,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            width: 36,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(svgPicture),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 13,
                    // color: AppColors.miscellaneousTabUnselected,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 36,
            width: 36,
            margin: EdgeInsets.only(left: 12),
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: isDone ? Color(0XFF009980) : Color(0XFFE5F4F2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: SvgPicture.asset(
              'assets/icons/single_city/tick.svg',
              colorFilter: ColorFilter.mode(
                isDone ? Color(0XFFE5F4F2) : Color(0XFF009980),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
