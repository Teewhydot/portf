import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portf/generated/assets.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';


class PortfolioSlider extends StatefulWidget {
  const PortfolioSlider({Key? key}) : super(key: key);

  @override
  State<PortfolioSlider> createState() => _PortfolioSliderState();
}

class _PortfolioSliderState extends State<PortfolioSlider> {
  List<Map<String, String>> projects = [
    {
      'title': 'Calc',
      'description': 'A simple calculator app, built with Flutter',
      'image': Assets.portfolioP1,
      'image2': Assets.portfolioP1,
      'image3': Assets.portfolioP1,
      'github': '',
      'netlify': '',
    },
    {
      'title': 'Foodly',
      'description': 'A food delivery app, built with Flutter',
      'image': Assets.portfolioP2,
      'image2': Assets.portfolioP1,
      'image3': Assets.portfolioP1,
      'github': '',
      'netlify': '',
    },
    {
      'title': 'Musica',
      'description': 'A music player app, built with Flutter',
      'image': Assets.portfolioP2,
      'image2': Assets.portfolioP1,
      'image3': Assets.portfolioP1,
      'github': '',
      'netlify': '',
    },
    {
      'title': 'Medical Klinik',
      'description': 'Short description of project 2',
      'image': Assets.portfolioP2,
      'image2': Assets.portfolioP1,
      'image3': Assets.portfolioP1,
      'github': '',
      'netlify': '',
    },
    {
      'title': 'Clone Chat',
      'description': 'Short description of project 2',
      'image': Assets.portfolioP2,
      'image2': Assets.portfolioP1,
      'image3': Assets.portfolioP1,
      'github': '',
      'netlify': '',
    },
    // Add more projects as needed
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
                                Image.asset(Assets.portfolioP1, height: 300),
                                addVerticalSpacing(20),
                                Image.asset(
                                  Assets.portfolioP1,
                                  height: 300,
                                ),
                                addVerticalSpacing(20),
                                Image.asset(
                                  Assets.portfolioP1,
                                  height: 300,
                                ),
                                addVerticalSpacing(20),
                                GestureDetector(
                                  onTap: () {},
                                  child: CustomButton(
                                      height: getVerticalSize(48),
                                      width: getHorizontalSize(150),
                                      text: "View as website".toUpperCase(),
                                      onTap: () {},
                                      margin: getMargin(top: 40)),
                                ),
                                addVerticalSpacing(10),
                                GestureDetector(
                                  onTap: () {},
                                  child: CustomButton(
                                      height: getVerticalSize(48),
                                      width: getHorizontalSize(150),
                                      text: "View on Github".toUpperCase(),
                                      onTap: () {},
                                      margin: getMargin(top: 20)),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(project['image']!),
                        fit: BoxFit.cover,
                      ),
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
