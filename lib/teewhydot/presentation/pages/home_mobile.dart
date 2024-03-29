import 'dart:math' as math;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:portf/generated/assets.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';
import 'package:portf/teewhydot/presentation/pages/about_section.dart';
import 'package:portf/teewhydot/presentation/pages/contact_section.dart';
import 'package:portf/teewhydot/presentation/pages/portfolio_section.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/fade_bottom_top_animation.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/services_widget.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final scrollController = ScrollController();
  bool showFab = false;
  final headerKey = const Key('header');
  final portfolioKey = const Key('portfolio');
  final servicesKey = const Key('Services');
  final aboutKey = const Key('about key');
  final contactKey = const Key('contact key');

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 500) {
        setState(() {
          showFab = true;
        });
      } else {
        setState(() {
          showFab = false;
        });
      }
    });
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  void dispose() {
    _controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double slide =
              MediaQuery.of(context).size.width * 0.66 * _controller.value;
          return GestureDetector(
            onHorizontalDragStart: (details) {
              if (details.globalPosition.dx < 50) {
                toggle();
              }
            },
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 0) {
                _controller.value += details.delta.dx / 200;
              }
            },
            onHorizontalDragEnd: (details) {
              if (_controller.value < 0.5) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: Stack(
              children: [
                // red container
                SizedBox(
                  width: getHorizontalSize(300),
                  height: double.infinity,
                  child: Material(
                    color: ColorConstant.scaffoldColorOne,
                    child: SafeArea(
                      child: Theme(
                        data: ThemeData(brightness: Brightness.dark),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {
                                scrollController.animateTo(0.0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic);
                                _controller.reverse();
                              },
                              child: const ListTile(
                                leading: Icon(Icons.home_filled),
                                title: Text('Home'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                scrollController.animateTo(getVerticalSize(750),
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic);
                                _controller.reverse();
                              },
                              child: const ListTile(
                                leading: Icon(Icons.miscellaneous_services),
                                title: Text('Services'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                scrollController.animateTo(getVerticalSize(1350),
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic);
                                _controller.reverse();
                              },
                              child: const ListTile(
                                leading: Icon(FontAwesomeIcons.networkWired),
                                title: Text('Portfolio'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                scrollController.animateTo(getVerticalSize(2000),
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic);
                                _controller.reverse();
                              },
                              child: const ListTile(
                                leading: Icon(Icons.person),
                                title: Text('About me'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                scrollController.animateTo(getVerticalSize(4150),
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic);
                                _controller.reverse();
                              },
                              child: const ListTile(
                                leading: Icon(Icons.contact_page),
                                title: Text('Contact'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                /// END OF Navigation widget
                Transform(
                  transform: Matrix4.translationValues(slide, 0.0, 0.0),
                  child: GestureDetector(
                    excludeFromSemantics: true,
                    onTap: () {
                      if (_controller.isCompleted) {
                        _controller.reverse();
                      }
                    },

                    /// BODY WIDGET
                    child: Scaffold(
                        floatingActionButton: showFab
                            ? FloatingActionButton(
                                backgroundColor: ColorConstant.gray900,
                                onPressed: () {
                                  scrollController.animateTo(0.0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOutCubic);
                                },
                                child: const Icon(Icons.arrow_upward),
                              )
                            : null,
                        backgroundColor: ColorConstant.scaffoldColorOne,
                        body: SafeArea(
                          child: ListView(
                            controller: scrollController,
                            children: [
                              GestureDetector(
                                onTap: toggle,
                                child: Padding(
                                  padding: getPadding(left: 22),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                        size: getSize(40),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FadeBottomTopAnimation(
                                customKey: headerKey,
                                child: Padding(
                                  padding: getPadding(
                                    left: 23,
                                    bottom: 50,
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: AnimateList(
                                          autoPlay: true,
                                          interval:
                                              const Duration(milliseconds: 199),
                                          effects: [
                                            const FadeEffect(
                                              duration:
                                                  Duration(milliseconds: 199),
                                              curve: Curves.easeIn,
                                            ),
                                            _controller.isCompleted
                                                ? const BlurEffect(
                                                    duration: Duration(
                                                        milliseconds: 399),
                                                  )
                                                : const Effect(
                                                    duration: Duration(
                                                        milliseconds: 399),
                                                  ),
                                          ],
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        top: 22, right: 6),
                                                    child: Text("Hi,",
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle.txtH2)),
                                                SizedBox(
                                                  height: 70,
                                                  width: 70,
                                                  child: Transform.rotate(
                                                    angle: -math.pi / 4,
                                                    child: Lottie.network(
                                                        animate: true,
                                                        reverse: true,
                                                        frameRate:
                                                            FrameRate.max,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            const Center(
                                                                child: Text(
                                                                    'Error')),
                                                        'https://assets1.lottiefiles.com/packages/lf20_dpohsucu.json'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                                padding: getPadding(
                                                    top: 22, right: 6),
                                                child: Text(
                                                    "I am Issa Abubakar",
                                                    maxLines: null,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtH2)),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  'I am a'.toUpperCase(),
                                                  style: AppStyle.txtH5
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  1.0)),
                                                ),
                                                const SizedBox(
                                                    width: 10.0, height: 70.0),
                                                DefaultTextStyle(
                                                  style: AppStyle.txtH5
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  1.0)),
                                                  child: AnimatedTextKit(
                                                    pause: const Duration(
                                                        milliseconds: 500),
                                                    repeatForever: true,
                                                    animatedTexts: [
                                                      RotateAnimatedText(
                                                          'FLUTTER Developer'
                                                              .toUpperCase()),
                                                      RotateAnimatedText(
                                                          'Cyber Security Specialist'
                                                              .toUpperCase()),
                                                    ],
                                                    onTap: () {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                            addVerticalSpacing(20),
                                            Padding(
                                                padding: getPadding(right: 45),
                                                child: Text(
                                                    "As a seasoned Developer, I possess a comprehensive skill set and invaluable experience that are perfectly suited to tackle your projects with finesse. My journey as a developer has been guided by exceptional coding communities, enabling me to master the craft and excel in executing highly sought-after projects.",
                                                    maxLines: null,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtText)),
                                            GestureDetector(
                                              onTap: () {},
                                              child: CustomButton(
                                                  height: getVerticalSize(48),
                                                  width: getHorizontalSize(154),
                                                  text: "See My Work"
                                                      .toUpperCase(),
                                                  onTap: () {
                                                    scrollController.animateTo(
                                                        getVerticalSize(1550),
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve: Curves
                                                            .easeInOutCubic);
                                                  },
                                                  margin: getMargin(top: 40)),
                                            ),
                                            addVerticalSpacing(250),
                                          ])),
                                ),
                              ),
                              FadeBottomTopAnimation(
                                customKey: servicesKey,
                                child: Padding(
                                  padding: getPadding(
                                    left: 23,
                                    bottom: 50,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: AnimateList(
                                      autoPlay: true,
                                      interval:
                                          const Duration(milliseconds: 399),
                                      effects: [
                                        const FadeEffect(
                                          duration: Duration(milliseconds: 199),
                                          curve: Curves.easeIn,
                                        ),
                                        _controller.isCompleted
                                            ? const BlurEffect(
                                                duration:
                                                    Duration(milliseconds: 399),
                                              )
                                            : const Effect(
                                                duration:
                                                    Duration(milliseconds: 399),
                                              ),
                                      ],
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                                "Services".toUpperCase(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtH5.copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(
                                                            3.0)))),
                                        const ServicesWidget(
                                            serviceName: 'Android Apps',
                                            serviceIcon: FaIcon(
                                              FontAwesomeIcons.android,
                                              color: Colors.white,
                                              size: 15.0,
                                            )),
                                        const ServicesWidget(
                                            serviceName: 'IOS Apps',
                                            serviceIcon: FaIcon(
                                              FontAwesomeIcons.appStoreIos,
                                              color: Colors.white,
                                              size: 15.0,
                                            )),
                                        const ServicesWidget(
                                            serviceName: 'Web Apps',
                                            serviceIcon: FaIcon(
                                              Icons.web,
                                              color: Colors.white,
                                              size: 15.0,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              FadeBottomTopAnimation(
                                  customKey: portfolioKey,
                                  child: PortfolioSection(
                                    effect: _controller.isCompleted
                                        ? const BlurEffect(
                                            duration:
                                                Duration(milliseconds: 399),
                                          )
                                        : const Effect(
                                            duration:
                                                Duration(milliseconds: 399),
                                          ),
                                  )),
                              addVerticalSpacing(250),
                              FadeBottomTopAnimation(
                                customKey: aboutKey,
                                child: AboutSection(
                                    name: 'Abubakar Issa',
                                    photoUrl: Assets.portfolioMe,
                                    effect: _controller.isCompleted
                                        ? const BlurEffect(
                                            duration:
                                                Duration(milliseconds: 399),
                                          )
                                        : const Effect(
                                            duration:
                                                Duration(milliseconds: 399),
                                          ),
                                    techStack: const [
                                      'Flutter',
                                      'Dart',
                                      'API',
                                      'Firebase',
                                    ]),
                              ),
                              addVerticalSpacing(250),
                              FadeBottomTopAnimation(
                                customKey: contactKey,
                                child: ContactSection(
                                  effect: _controller.isCompleted
                                      ? const BlurEffect(
                                          duration: Duration(milliseconds: 399),
                                        )
                                      : const Effect(
                                          duration: Duration(milliseconds: 399),
                                        ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
