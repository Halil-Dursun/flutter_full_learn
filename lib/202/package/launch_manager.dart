
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin  {
  void slaunchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
