import 'package:flutter_html/flutter_html.dart';
import 'package:visit_uzbekistan/widget_imports.dart';

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
            children: [
              Html(data: state.singleArticle.desc),
            ],
          );
        },
      ),
    );
  }
}
