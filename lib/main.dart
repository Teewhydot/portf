import 'package:flutter/material.dart';

import 'teewhydot/presentation/pages/home_translate.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(builder: (BuildContext context,BoxConstraints boxConstraints){
        if(boxConstraints.maxWidth < 500){
          return const CustomHomeTranslate();
        }else {
          return const Scaffold(
            body: Center(
              child: Text("Desktop Version in development", style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.underline
              ),),
            ),
          );
        }
      } ),
    );
  }
}
