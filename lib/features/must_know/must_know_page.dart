import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MustKnowPage extends StatefulWidget {
  final int id;

  const MustKnowPage({
    super.key,
    required this.id,
  });

  @override
  State<MustKnowPage> createState() => _MustKnowPageState();
}

class _MustKnowPageState extends State<MustKnowPage> {
  late final WebViewController _controller;
  double _progress = 0;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
            setState(() {
              _progress = progress / 100;
            });
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.id == 0
          ? 'https://uzbek-travel.com/visa/registration/'
          : 'https://www.uzcaa.uz/en/drones'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == 0
            ? 'Registration in Uzbekistan'
            : 'Drones are NOT ALLOWED in Uzbekistan '),
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
