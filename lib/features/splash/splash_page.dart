import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..assignToken(),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          if (state.token.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.rootPage,
                  (route) => false,
                );
              });
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.onBoardingPage,
                  (route) => false,
                );
              });
            });
          }

          return Scaffold(
            backgroundColor: AppColors.rootBgColor,
            body: _SplashView(),
          );
        },
      ),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(IconsaxPlusLinear.map, size: 150),
          SizedBox(height: 80.h),
          CircularProgressIndicator(color: AppColors.primary),
        ],
      ),
    );
  }
}
