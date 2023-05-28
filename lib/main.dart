import 'package:flutter/material.dart';
import 'teewhydot/domain/theme/color_constant.dart';
import 'teewhydot/domain/utils/preload_images.dart';
import 'teewhydot/presentation/pages/home_translate.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final LoadImages loadImages = LoadImages();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImages.loadImages();

}
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    loadImages.precacheImages(context);

  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      color: ColorConstant.scaffoldColorOne,
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(builder: (BuildContext context,BoxConstraints boxConstraints){
        if(boxConstraints.maxWidth < 600){
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
