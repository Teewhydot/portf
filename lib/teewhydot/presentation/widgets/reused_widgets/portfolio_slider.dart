import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portf/generated/assets.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/functions.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';


class PortfolioSlider extends StatefulWidget {
  const PortfolioSlider({Key? key}) : super(key: key);

  @override
  State<PortfolioSlider> createState() => _PortfolioSliderState();
}

class _PortfolioSliderState extends State<PortfolioSlider> {
  List<Map<String, dynamic>> projects = [
    {
      'title': 'Calc',
      'description': 'A simple calculator app, built with Flutter',
      'image': Assets.appImagesCalc1,
      'image2': Assets.appImagesCalc2,
      'image3': Assets.appImagesCalc3,
      'isNetlify' : true,
      'github': 'https://github.com/Teewhydot/calc',
      'netlify': '',
      'displayColor' : const Color(0xffe6e6e6),
    },
    {
      'title': 'Foodly',
      'description': 'A food delivery app, built with Flutter',
      'image': Assets.appImagesFoodly1,
      'image2': Assets.appImagesFoodly2,
      'image3': Assets.appImagesFoodly3,
      'isNetlify' : false,

      'github': '',
      'netlify': '',
      'displayColor' : Colors.green,

    },
    {
      'title': 'Musica',
      'description': 'A music player app, built with Flutter',
      'image': Assets.appImagesMusica1,
      'image2': Assets.appImagesMusica2,
      'image3': Assets.appImagesMusica3,
      'isNetlify' : true,

      'github': 'https://github.com/Teewhydot/musica',
      'netlify': 'https://miusica.netlify.app/',
      'displayColor' : Colors.blueAccent,

    },
    {
      'title': 'Medical Klinik',
      'description': 'A medical clinic app for booking appointments, built with Flutter',
      'image': Assets.appImagesMk1,
      'image2': Assets.appImagesMk2,
      'image3': Assets.appImagesMk3,
      'github': 'https://github.com/Teewhydot/medical_clinik',
      'netlify': '',
      'displayColor' : Colors.redAccent,
      'isNetlify' : true,
    },
    {
      'title': 'RockPaperScissors Game',
      'description': 'Roc Paper Scissors game built with flutter',
      'image': Assets.appImagesRps1,
      'image2': Assets.appImagesRps2,
      'image3': Assets.appImagesRps3,
      'github': 'https://github.com/Teewhydot/rock_paper_scissors',
      'isNetlify' : true,
      'netlify': 'https://rockpaperscissors-lizardspock.netlify.app/',
      'displayColor' : Colors.white,
    },
    {
      'title': 'Podcast App',
      'description': 'A podcast app, built with Flutter',
      'image': Assets.appImagesPcast1,
      'image2': Assets.appImagesPcast2,
      'image3': Assets.appImagesPcast3,
      'github': 'https://github.com/Teewhydot/pcast_app',
      'netlify': '',
      'displayColor' : Colors.white,
      'isNetlify' : false,


    },
    {
      'title': 'Random Advice app',
      'description': 'A random advice app, built with Flutter',
      'image': Assets.appImagesAdvice1,
      'image2': Assets.appImagesAdvice2,
      'image3': Assets.appImagesAdvice3,
      'github': '',
      'netlify': 'https://randomadvicesapp.netlify.app/',
      'displayColor' : Colors.yellowAccent,
      'isNetlify' : true,


    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enableInfiniteScroll: false,
        animateToClosest: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        pauseAutoPlayOnManualNavigate: true,
        scrollPhysics: const BouncingScrollPhysics(),
        pauseAutoPlayOnTouch: true,
        autoPlay: true,
      ),
      items: projects.map(
        (project) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    enableDrag: true,
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.deepOrange100,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                          padding: getPadding(
                              left: 20, right: 20, top: 30, bottom: 0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  project['title']!,
                                  style: AppStyle.txtH4Gray900,
                                ),
                                Text(project['description']!),
                                addVerticalSpacing(20),
                                Image.asset(project['image']!, height: 400),
                                addVerticalSpacing(20),
                                Image.asset(
                                  project['image2']!,
                                  height: 400,
                                ),
                                addVerticalSpacing(20),
                                Image.asset(
                                  project['image3']!,
                                  height: 400,
                                ),
                                addVerticalSpacing(20),
                                Visibility(
                                  visible: project['isNetlify'],
                                  child: CustomButton(
                                      height: getVerticalSize(48),
                                      width: getHorizontalSize(150),
                                      text: "View demo".toUpperCase(),
                                      onTap: () {
                                        launchURLString(project['netlify']!,context);
                                      },
                                      margin: getMargin(top: 40)),
                                ),
                                addVerticalSpacing(10),
                                CustomButton(
                                    height: getVerticalSize(48),
                                    width: getHorizontalSize(150),
                                    text: "View on Github".toUpperCase(),
                                    onTap: () {
                                      launchURLString(project['github']!,context);
                                    },
                                    margin: getMargin(top: 20)),
                                addVerticalSpacing(10),


                              ],
                            ),
                          )),
                    ),
                  );
                },
                child: Container(
                  width: getHorizontalSize(200),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: project['displayColor']!,

                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              project['title']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            addVerticalSpacing(8),
                            Text(
                              project['description']!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
