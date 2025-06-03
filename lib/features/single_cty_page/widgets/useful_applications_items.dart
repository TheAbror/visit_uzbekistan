import 'package:visit_uzbekistan/widgets/widget_imports.dart';

class UsefulApplicationssItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String svgPicture;
  final bool isLast;

  const UsefulApplicationssItem({
    super.key,
    required this.svgPicture,
    required this.title,
    required this.subTitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        children: [
          // SvgPicture.asset(svgPicture),
          SvgPicture.asset(svgPicture),

          SizedBox(width: 12),
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
                SizedBox(height: 2),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0XFF999999),
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SvgPicture.asset('assets/icons/single_city/arrow-right.svg'),
        ],
      ),
    );
  }
}
