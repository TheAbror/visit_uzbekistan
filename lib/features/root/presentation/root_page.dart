import 'package:visit_uzbekistan/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();

    context.read<RootBloc>().getCities();
    context.read<RootBloc>().getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0XFFEEF2F6),
          body: IndexedStack(
            index: state.tabIndex,
            children: [
              HomeTab(),
              SizedBox(),
              ProfileTab(),
              MoreTab(),
            ],
          ),
          extendBody: true,
          bottomNavigationBar: RootPageBottomAppBar(tabIndex: state.tabIndex),
        );
      },
    );
  }
}
