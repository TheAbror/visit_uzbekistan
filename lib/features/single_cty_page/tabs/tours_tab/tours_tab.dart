import 'package:webview_flutter/webview_flutter.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class ToursTab extends StatefulWidget {
  const ToursTab({super.key});

  @override
  State<ToursTab> createState() => _ToursTabState();
}

class _ToursTabState extends State<ToursTab> {
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
      ..loadRequest(Uri.parse('https://khivatravels.uz/tours/yurt-camp-tour'));
  }

  @override
  Widget build(BuildContext context) {
    //TODO
    return WebViewWidget(controller: _controller);

    SizedBox(
      height: 400.h,
      width: double.infinity,
      child: Column(
        children: [
          (_progress < 1)
              ? LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                )
              : SizedBox.shrink(),
          WebViewWidget(controller: _controller),
        ],
      ),
    );
  }
}
