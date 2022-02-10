import 'package:url_launcher/url_launcher.dart';

class Helpers {
  Future<void> makePhoneCall(String url) async {
    url = url.replaceAll(new RegExp(r'[^0-9]'), '');
    url = "tel:" + url;
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
