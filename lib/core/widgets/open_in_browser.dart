import 'package:url_launcher/url_launcher.dart';

Future<void> openInBrowser(String url) async {
  final uri = Uri.parse(url);
  canLaunchUrl(uri).then((canLaunch) async {
    if (canLaunch) {
      await launchUrl(uri);
    }
  });
}
