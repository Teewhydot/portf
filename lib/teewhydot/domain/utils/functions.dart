
import 'dart:io';

import 'package:flutter/foundation.dart';
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
    Toast.show("Could not launch website.",
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

Future<String> downloadFile(String url, String fileName, String dir) async {
  HttpClient httpClient = HttpClient();
  File file;
  String filePath = '';
  String myUrl = '';

  try {
    myUrl = '$url/$fileName';
    var request = await httpClient.getUrl(Uri.parse(myUrl));
    var response = await request.close();
    if(response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      filePath = '$dir/$fileName';
      file = File(filePath);
      await file.writeAsBytes(bytes);
    }
    else {
      filePath = 'Error code: ${response.statusCode}';
    }
  }
  catch(ex){
    filePath = 'Can not fetch url';
  }

  return filePath;
}