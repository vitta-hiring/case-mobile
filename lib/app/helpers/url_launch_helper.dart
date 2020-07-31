import 'package:url_launcher/url_launcher.dart';

class LaunchHelper {
  static Future<bool> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    }
    return false;
  }
}
