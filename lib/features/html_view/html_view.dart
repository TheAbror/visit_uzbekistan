import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class HtmlView extends StatefulWidget {
  final int id;

  const HtmlView({
    super.key,
    required this.id,
  });

  @override
  State<HtmlView> createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().getSingleArticle(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              bottom: 40.h,
            ),
            children: [
              HtmlWidget(state.singleArticle.desc),
            ],
          );
        },
      ),
    );
  }
}
