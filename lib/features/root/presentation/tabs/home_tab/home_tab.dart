import 'package:visit_uzbekistan/widget_imports.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.blocProgress == BlocProgress.FAILED) {
            return const SomethingWentWrong();
          }

          return ListView(
            children: [
              TitleAndViewAllWidget(
                title: 'Cities',
                onTap: () {},
              ),
              HomeTabItems(item: state.cities),
              //
              TitleAndViewAllWidget(
                title: 'Places',
                onTap: () {},
              ),
              HomeTabItems(item: state.places),
              //
              // TitleAndViewAllWidget(
              //   title: 'Some dummy text',
              //   onTap: () {},
              // ),
              // HomeTabItems(),
            ],
          );
        },
      ),
    );
  }
}
