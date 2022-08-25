import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utilitites/utilities.dart';

class Footer extends StatelessWidget {
  final bool isLoginPage;
  const Footer({Key? key, required this.isLoginPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 50,
      runSpacing: 15,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton.icon(
            onPressed: () async {
              await launchUrl(
                  Uri(scheme: 'mailto', path: 'support@minuendo.com'));
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all<Color>(
                    isLoginPage ? Colors.transparent : Colors.grey.shade200),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                            color: !isLoginPage
                                ? Colors.black54
                                : Colors.white)))),
            icon: Icon(
              Icons.mail,
              size: 12,
              color: Colors.red.shade400,
            ),
            label: Text('Contact',
                style: TextStyle(
                    fontSize: 10,
                    color: !isLoginPage ? Colors.black54 : Colors.white))),
        ElevatedButton.icon(
            onPressed: () {
              final Uri url = Uri(
                  scheme: 'https',
                  host: 'help.minuendo.com',
                  path: '/en/support/smart-alert-earplug',
                  query: 'utm_medium=link&utm_source=url');
              Utilities.openBrowserUrl(url: url);
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all<Color>(
                    isLoginPage ? Colors.transparent : Colors.grey.shade200),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                            color: !isLoginPage
                                ? Colors.black54
                                : Colors.white)))),
            icon: Icon(
              Icons.support_rounded,
              size: 12,
              color: Colors.red.shade400,
            ),
            label: Text('Support',
                style: TextStyle(
                    fontSize: 10,
                    color: !isLoginPage ? Colors.black54 : Colors.white))),
        Text(
          'Support +99 88 88 44',
          style: TextStyle(
              color: !isLoginPage ? Colors.black54 : Colors.white,
              fontSize: 10),
        ),
        Text(
          'Nedre Slottsgate 2 C, 0153 Oslo',
          style: TextStyle(
              color: !isLoginPage ? Colors.black54 : Colors.white,
              fontSize: 10),
        ),
      ],
    );
  }
}
