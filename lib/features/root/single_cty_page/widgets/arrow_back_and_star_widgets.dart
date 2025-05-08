import 'package:visit_uzbekistan/widget_imports.dart';

class ArrowBackAndStarWidgets extends StatelessWidget {
  const ArrowBackAndStarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 58,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child:
                  SvgPicture.asset('assets/icons/single_city/arrow-left.svg'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset('assets/icons/single_city/star.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
