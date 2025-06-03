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
          final _height = 300.h;

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              Image.network(
                item.photo,
                height: _height,
                width: double.infinity,
                fit: BoxFit.contain,
                //error case
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return Container(
                    height: _height.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sign_in_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                //loader case
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: _height.h,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
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
