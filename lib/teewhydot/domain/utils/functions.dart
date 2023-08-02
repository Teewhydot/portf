
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

void launchURLString(String url, BuildContext context) async {
  ToastContext().init(context);
  if (await canLaunchUrlString(
    url,
  )) {
    await launchUrlString(url,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ));
  } else {
    Toast.show("Could not launch website. Please view on github",
        textStyle: const TextStyle(color: Colors.black),
        duration: Toast.lengthShort,
        gravity: Toast.center,
        backgroundColor: Colors.yellowAccent);
  }
}
//
// class CVDownloadButton extends StatelessWidget {
//   final String cvUrl;
//
//   const CVDownloadButton({super.key, required this.cvUrl});
//
//   void _launchURL() async {
//     if (await canLaunchUrlString(cvUrl)) {
//       await launchUrlString(cvUrl);
//     } else {
//       throw 'Could not launch $cvUrl';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: _launchURL,
//       child: Text('Download CV'),
//     );
//   }
// }
