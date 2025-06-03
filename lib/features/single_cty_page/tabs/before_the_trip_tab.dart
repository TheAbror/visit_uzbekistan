import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class BeforeTheTripTab extends StatelessWidget {
  const BeforeTheTripTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        SingleCityTitle(title: 'Useful Apps'),
        SubTitle(
            subTitle:
                'Download this apps beforehand to make your trip easier and faster'),
        SizedBox(height: 12),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: AppColors.usefulAppsBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  UsefulApplicationssItem(
                    title: 'RMVgo',
                    subTitle: 'Tickets & routes for public transport',
                    svgPicture: 'assets/icons/single_city/dbbahnho.svg',
                  ),
                  UsefulApplicationssItem(
                    title: 'DB Bahnhof live',
                    subTitle: 'Live train tracking and train information',
                    svgPicture: 'assets/icons/single_city/dbbahnho.svg',
                  ),
                  UsefulApplicationssItem(
                    title: 'Free Now',
                    subTitle: 'Taxi and car rental',
                    svgPicture: 'assets/icons/single_city/freenow.svg',
                    isLast: true,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 19,
                ),
                decoration: BoxDecoration(
                  color: Color(0XFF2A2A2A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Show all',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SingleCityTitle(title: 'Things to do'),
        SubTitle(
            subTitle:
                'Things to do before your trip, so that you won’t have to worry about them later'),
        SizedBox(height: 12),
        Column(
          children: [
            ThingsToDoItem(
              title: 'E-sim / Roaming data',
              subTitle:
                  'Get e-sim or rouming data - it’s cheaper to get it beforehand',
              svgPicture: 'assets/icons/single_city/simcard.svg',
              isDone: true,
            ),
            ThingsToDoItem(
              title: 'Copy your documents',
              subTitle: 'Scan or print the copy of your ... show more',
              svgPicture: 'assets/icons/single_city/simcard.svg',
            ),
            ThingsToDoItem(
              title: 'E-sim / Roaming data',
              subTitle:
                  'It will be cheaper for you to convert some amount of your local currency to the currency of your destination. It’s often cheaper than exchanging it on the airport.',
              svgPicture: 'assets/icons/single_city/simcard.svg',
            ),
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
