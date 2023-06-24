import 'package:flutter/material.dart';
import 'package:portf/teewhydot/presentation/pages/home_desktop.dart';
import 'teewhydot/domain/theme/color_constant.dart';
import 'teewhydot/domain/utils/preload_images.dart';
import 'teewhydot/presentation/pages/home_mobile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          return const HomeMobile();
        }else {
          return HomeDesktop();
        }
      } ),
    );
  }
}
