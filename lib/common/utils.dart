import 'package:url_launcher/url_launcher.dart' as urlLauncher;

String shortHash(String hash) {
  return hash.substring(0, 12) +
      '...' +
      hash.substring(hash.length - 12, hash.length);
}

void launchUrl(String url) async {
  if (await urlLauncher.canLaunch(url)) {
    await urlLauncher.launch(
      url,
      enableJavaScript: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}
