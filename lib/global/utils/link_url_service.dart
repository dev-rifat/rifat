import 'package:url_launcher/url_launcher.dart';

Future<void> openCustomUrl( String urlString) async {
  try {
    final url = Uri.parse(urlString);

    if (await canLaunchUrl(url)) {
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // opens in external app/browser
      );

      if (!launched) {
      }
    } else {
    }
  } catch (e) {
  }
}


