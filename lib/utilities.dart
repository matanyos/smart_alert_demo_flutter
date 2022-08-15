import 'package:url_launcher/url_launcher.dart';

class Utilities
{
    static Future<void> openBrowserUrl({required Uri url}) async 
  {
      await launchUrl(url,mode: LaunchMode.platformDefault);
  }
}