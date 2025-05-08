import 'package:visit_uzbekistan/core/constants/text_named_const_widget.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://lh5.googleusercontent.com/p/AF1QipPcRFa-uJRwWTSvhTGah5kKl776WBslZhhSDnus=w1080-h624-n-k-no',
      'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcTbieaze3U3seM1OafqgEOUYuOz2WZv-8qg5LafFPJyxzvJV_l1I5nwsIhxUnu38_dsm1YipmFlA3Ec5HL7Z_xEW9cPcyDe4dGCZHeEzQ',
      'https://lh5.googleusercontent.com/p/AF1QipM84I89Yw6VqjYDjua6KZJJZ0TYmls5hb6t9jLJ=w1080-h624-n-k-no',
      'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQt5VjtiKK_Ersw6MMIWEmULmKh2eX8jToM384_6QqH018ZwyoYRrsSJu9wo7yuhp93bhj4doenkoIEnnPlGKzliPGihjz2Nsk7pfrdPA',
    ];

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 124.h),
            ProfileTabAppBar(),
            ProfileTabHeading(
              text: 'About me',
              isViewAllNeeded: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppText.subHeading(
                '''Traveling is a spiritual experience. It helps see contrast, and appreciate the contrast.  You learn that places, situations, weather, culture and people can change, but it reminds you & us.''',
              ),
            ),
            ProfileTabHeading(
              text: 'Communications',
              isViewAllNeeded: false,
            ),
            ProfilePageBodyItem(
              text: 'Followers',
              onTap: () {},
            ),
            ProfilePageBodyItem(
              text: 'Subscribers',
              onTap: () {},
            ),
            ProfileTabHeading(
              text: 'My last trips',
              isViewAllNeeded: true,
            ),
            ProfileTabLastTripsCarousel(),
            ProfileTabHeading(
              text: 'My hints',
              isViewAllNeeded: true,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: CarouselView(
                itemExtent: 330,
                shrinkExtent: 200,
                padding: const EdgeInsets.all(10.0),
                children: List.generate(
                  images.length,
                  (index) => Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        appBar(),
      ],
    );
  }

  Widget appBar() {
    return CustomAppBar(
      title: 'Vlog',
      color: AppColors.primary,
      height: 56.h,
    );
  }
}

class ProfileTabAppBar extends StatelessWidget {
  const ProfileTabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // GoogleSignInModel hiveUser =
    //     HiveHelperUser.googleSignInBox.get(HiveBoxes.googleUser);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // if (hiveUser.photoUrl?.isNotEmpty == true)
          //   CircleAvatar(
          //     radius: 26,
          //     backgroundColor: Colors.blueAccent,
          //     backgroundImage: NetworkImage(
          //       hiveUser.photoUrl ?? '',
          //     ),
          //   ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   hiveUser.fullName ?? '',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              // ),
              // Text(
              //   hiveUser.email ?? '',
              //   style: TextStyle(fontSize: 12),
              // ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class ProfileTabHeading extends StatelessWidget {
  final String text;
  final bool isViewAllNeeded;

  const ProfileTabHeading({
    super.key,
    required this.text,
    required this.isViewAllNeeded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.subheadSemiBold(text),
              if (isViewAllNeeded) AppText.subheadSemiBold('View all'),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ProfileTabLastTripsCarousel extends StatelessWidget {
  const ProfileTabLastTripsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              child: Image.network(
                'https://content.tui.co.uk/adamtui/2018_4/11_9/9ea1cf9f-b639-46ac-bc61-a8bf009cd9ac/ITA_COM_F0047WebOriginalCompressed.jpg?i10c=img.resize(width:1080);img.crop(width:1080%2Cheight:608)',
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.subheadSemiBold(
                  'Lake Como',
                ),
                AppText.caption1(
                  'Lake Como, in Northern Italy’s Lombardy region, is an upscale resort ',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfilePageBodyItem extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const ProfilePageBodyItem({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 6,
          left: 16,
          right: 16,
        ),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: AppColors.defaultShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.paragraph2(text),
            Icon(Icons.keyboard_arrow_right_outlined),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String title;
  final String? subtitle;
  final double height;
  final bool withElevation;
  final bool backButton;
  final Function()? backButtonPressed;

  const CustomAppBar({
    required this.title,
    this.color = Colors.white,
    this.height = kToolbarHeight,
    this.withElevation = true,
    this.backButton = false,
    this.backButtonPressed,
    this.subtitle,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final subtitleText = subtitle;

    return Container(
      height: height + topPadding,
      color: color ?? Colors.blue,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: preferredSize.height,
        color: color,
        child: Row(
          children: [
            backButton
                ? GestureDetector(
                    onTap:
                        backButtonPressed ?? () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.only(left: 16),
                      width: 56,
                      height: 56,
                      child: const Icon(
                        Icons.chevron_left,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                  )
                : SizedBox(
                    width: 56.w,
                  ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title.length > 20
                              ? '${title.substring(0, 20)}...'
                              : title,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        if (subtitleText != null)
                          Text(
                            subtitleText.length > 20
                                ? '${subtitleText.substring(0, 20)}...'
                                : subtitleText,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade300,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              width: 56,
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
