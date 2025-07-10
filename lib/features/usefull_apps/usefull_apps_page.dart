import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class UsefullAppsPage extends StatefulWidget {
  final IdandTitle idandTitle;

  const UsefullAppsPage({
    super.key,
    required this.idandTitle,
  });

  @override
  State<UsefullAppsPage> createState() => _UsefullAppsPageState();
}

class _UsefullAppsPageState extends State<UsefullAppsPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().getSingleUsefulApp(context, widget.idandTitle.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SingleCityPageLeadingIcon(),
        actions: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return DownloadWidget(
                id: widget.idandTitle.id,
                newItem: state.usefulApps.model
                    .firstWhere((e) => e.id == widget.idandTitle.id),
              );
            },
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          //TODO
          if (state.singleUsefulApp.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          final item = state.singleUsefulApp.model;
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: HtmlWidget(state.singleUsefulApp.model.info),
              ),
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
