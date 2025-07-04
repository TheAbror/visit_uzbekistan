import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MustKnowPage extends StatefulWidget {
  final IdandTitle idandTitle;

  const MustKnowPage({
    super.key,
    required this.idandTitle,
  });

  @override
  State<MustKnowPage> createState() => _MustKnowPageState();
}

class _MustKnowPageState extends State<MustKnowPage> {
  late final WebViewController _controller;
  double _progress = 0;

  @override
  void initState() {
    final _bloc = context.read<HomeBloc>().state;

    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
            if (mounted) {
              setState(() {
                _progress = progress / 100;
              });
            }
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
        ),
      )
      ..loadRequest(Uri.parse(
          _bloc.mustKnow.firstWhere((e) => e.id == widget.idandTitle.id).link ??
              ''));
  }

  @override
  void dispose() {
    // Optionally clean up or remove listeners from _controller if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<HomeBloc>().state;

    return Scaffold(
      appBar: AppBar(
        leading: SingleCityPageLeadingIcon(),
        title: Text(_bloc.mustKnow
            .firstWhere((e) => e.id == widget.idandTitle.id)
            .name),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0),
          child: (_progress < 1)
              ? LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                )
              : SizedBox.shrink(),
        ),
      ),
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
