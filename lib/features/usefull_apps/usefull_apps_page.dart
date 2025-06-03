import 'package:visit_uzbekistan/widget_imports.dart';

class UsefullAppsPage extends StatelessWidget {
  final int id;

  const UsefullAppsPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final item = state.usefulApps[id];

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              Image.network(
                item.photo,
                height: 300.h,
                width: double.infinity,
                fit: BoxFit.contain,
                //add error and loader builder
              ),
              SizedBox(height: 20.h),
              Text(item.shortDescription),
              SizedBox(height: 20.h),
              ActionButton(
                text: 'Download',
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
