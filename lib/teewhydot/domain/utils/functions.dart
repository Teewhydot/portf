
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