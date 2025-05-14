import 'package:visit_uzbekistan/core/buttons/action_button.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primaryDark,
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
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_gradient.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.travel_explore,
            size: 150,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ActionButton(
              text: 'Skip',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.onBoardingPage);
              },
            ),
          ),
        ),
      ],
    );
  }
}
