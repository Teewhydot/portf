import 'package:flutter/material.dart';

import 'teewhydot/presentation/pages/home_translate.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomHomeTranslate(),
    );
  }
}
