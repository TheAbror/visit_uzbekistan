import 'package:visit_uzbekistan/widget_imports.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/auth/onboarding';

  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushNamed(context, AppRoutes.logInPage);
  }

  // ignore: unused_element
  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          autoScrollDuration: 3000,
          infiniteAutoScroll: true,
          pages: [
            PageViewModel(
              title: 'Visit Uzbekistan',
              body:
                  'Discover the land of ancient cities, vibrant markets, and warm hospitality. From the Silk Road to stunning architecture, Uzbekistan offers a unique blend of history and culture that’s waiting to be explored.',
              image: _buildImage('img1.jpg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: 'Plan Smarter. Travel Easier',
              body:
                  'Get essential travel tips, find top-rated tours, explore where to eat and stay, and prepare with confidence. Everything you need—before and during your trip—is right here in one app.',
              image: _buildImage('img2.jpg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: 'Explore with Confidence, Anytime.',
              body:
                  'Enjoy offline maps, safety advice, eSIM info, and multi-language support. Whether it’s Tashkent or Samarkand, we’ve got you covered—wherever your journey takes you.',
              image: _buildImage('img3.jpg'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroEnd(context),
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          back: const Icon(Icons.arrow_back),
          skip: Text(
            'Skip',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          next: const Icon(Icons.arrow_forward),
          done: Text(
            'Done',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
