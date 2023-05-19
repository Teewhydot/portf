// import 'dart:math' as math;
//
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:lottie/lottie.dart';
// import 'package:portf/generated/assets.dart';
// import 'package:portf/teewhydot/domain/theme/app_style.dart';
// import 'package:portf/teewhydot/domain/theme/color_constant.dart';
// import 'package:portf/teewhydot/domain/utils/size_utils.dart';
// import 'package:portf/teewhydot/domain/utils/space_utils.dart';
// import 'package:portf/teewhydot/presentation/pages/about_section.dart';
// import 'package:portf/teewhydot/presentation/pages/contact_section.dart';
// import 'package:portf/teewhydot/presentation/pages/portfolio_section.dart';
// import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';
// import 'package:portf/teewhydot/presentation/widgets/reused_widgets/fade_bottom_top_animation.dart';
//
//
// class HomeRotate extends StatefulWidget {
//   const HomeRotate({
//     Key? key,
//   }) : super(key: key);
//
//   static HomeRotateState? of(BuildContext context) =>
//       context.findAncestorStateOfType<HomeRotateState>();
//
//   @override
//   HomeRotateState createState() => HomeRotateState();
// }
//
// class HomeRotateState extends State<HomeRotate>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   final scrollController = ScrollController();
//   final headerKey = const Key('header');
//   final portfolioKey = const Key('portfolio');
//   final servicesKey = const Key('Services');
//   final aboutKey = const Key('about key');
//
//   final contactKey = const Key('contact key');
//   bool _canBeDragged = false;
//   final double maxSlide = 300.0;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//   }
//
//   @override
//   void dispose() {
//     animationController.dispose();
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   void toggle() => animationController.isDismissed
//       ? animationController.forward()
//       : animationController.reverse();
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animationController,
//       builder: (context, _) {
//         return Material(
//           color: Colors.blueGrey,
//           child: Stack(
//             children: <Widget>[
//               Transform.translate(
//                 offset: Offset(maxSlide * (animationController.value - 1), 0),
//                 child: Transform(
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..rotateY(math.pi / 2 * (1 - animationController.value)),
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       toggle();
//                     },
//                     child: SizedBox(
//                       width: 300,
//                       height: double.infinity,
//                       child: Material(
//                         color: ColorConstant.scaffoldColorOne,
//                         child: SafeArea(
//                           child: Theme(
//                             data: ThemeData(brightness: Brightness.dark),
//                             child: const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 ListTile(
//                                   leading: Icon(Icons.home_filled),
//                                   title: Text('Home'),
//                                 ),
//                                 ListTile(
//                                   leading: Icon(Icons.miscellaneous_services),
//                                   title: Text('Services'),
//                                 ),
//                                 ListTile(
//                                   leading: Icon(FontAwesomeIcons.networkWired),
//                                   title: Text('Portfolio'),
//                                 ),
//                                 ListTile(
//                                   leading: Icon(Icons.person),
//                                   title: Text('About me'),
//                                 ),
//                                 ListTile(
//                                   leading: Icon(Icons.contact_page),
//                                   title: Text('Contact'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(maxSlide * animationController.value, 0),
//                 child: Transform(
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..rotateY(-math.pi * animationController.value / 2),
//                   alignment: Alignment.centerLeft,
//                   child: GestureDetector(
//                     onHorizontalDragStart: _onDragStart,
//                     onHorizontalDragUpdate: _onDragUpdate,
//                     onHorizontalDragEnd: _onDragEnd,
//                     behavior: HitTestBehavior.translucent,
//                     child: Scaffold(
//                         backgroundColor: ColorConstant.scaffoldColorOne,
//                         body: SingleChildScrollView(
//                           controller: context.scrollController,
//                           child: SafeArea(
//                             child: ListView(
//                               children: [
//                                 GestureDetector(
//                                   onTap: toggle,
//                                   child: Padding(
//                                     padding: getPadding(left: 22),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Icon(
//                                           Icons.menu,
//                                           color: Colors.white,
//                                           size: getSize(40),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 FadeBottomTopAnimation(
//                                   key: headerKey,
//                                   child: Padding(
//                                     padding: getPadding(
//                                       left: 23,
//                                       bottom: 50,
//                                     ),
//                                     child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: AnimateList(
//                                             autoPlay: true,
//                                             interval: const Duration(
//                                                 milliseconds: 399),
//                                             effects: [
//                                               const FadeEffect(
//                                                 duration:
//                                                     Duration(milliseconds: 199),
//                                                 curve: Curves.easeIn,
//                                               )
//                                             ],
//                                             children: [
//                                               Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.end,
//                                                 children: [
//                                                   Padding(
//                                                       padding: getPadding(
//                                                           top: 22, right: 6),
//                                                       child: Text("Hi,",
//                                                           maxLines: null,
//                                                           textAlign:
//                                                               TextAlign.left,
//                                                           style:
//                                                               AppStyle.txtH2)),
//                                                   SizedBox(
//                                                     height: 70,
//                                                     width: 70,
//                                                     child: Transform.rotate(
//                                                       angle: -math.pi / 4,
//                                                       child: Lottie.network(
//                                                           animate: true,
//                                                           reverse: true,
//                                                           frameRate:
//                                                               FrameRate.max,
//                                                           errorBuilder: (context,
//                                                                   error,
//                                                                   stackTrace) =>
//                                                               const Center(
//                                                                   child: Text(
//                                                                       'Error')),
//                                                           'https://assets1.lottiefiles.com/packages/lf20_dpohsucu.json'),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Padding(
//                                                   padding: getPadding(
//                                                       top: 22, right: 6),
//                                                   child: Text(
//                                                       "I am Issa Abubakar",
//                                                       maxLines: null,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle.txtH2)),
//                                               Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: <Widget>[
//                                                   Text(
//                                                     'I am a'.toUpperCase(),
//                                                     style: AppStyle.txtH5
//                                                         .copyWith(
//                                                             letterSpacing:
//                                                                 getHorizontalSize(
//                                                                     1.0)),
//                                                   ),
//                                                   const SizedBox(
//                                                       width: 10.0,
//                                                       height: 70.0),
//                                                   DefaultTextStyle(
//                                                     style: AppStyle.txtH5
//                                                         .copyWith(
//                                                             letterSpacing:
//                                                                 getHorizontalSize(
//                                                                     1.0)),
//                                                     child: AnimatedTextKit(
//                                                       pause: const Duration(
//                                                           milliseconds: 500),
//                                                       repeatForever: true,
//                                                       animatedTexts: [
//                                                         RotateAnimatedText(
//                                                             'FLUTTER Developer'
//                                                                 .toUpperCase()),
//                                                         RotateAnimatedText(
//                                                             'BLOCKCHAIN Developer'
//                                                                 .toUpperCase()),
//                                                       ],
//                                                       onTap: () {},
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               addVerticalSpacing(20),
//                                               Padding(
//                                                   padding:
//                                                       getPadding(right: 45),
//                                                   child: Text(
//                                                       "Agency provides a full service range including technical skills, design, business understanding.",
//                                                       maxLines: null,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle.txtText)),
//                                               GestureDetector(
//                                                 onTap: () {},
//                                                 child: CustomButton(
//                                                     height: getVerticalSize(48),
//                                                     width:
//                                                         getHorizontalSize(154),
//                                                     text: "See My Work"
//                                                         .toUpperCase(),
//                                                     onTap: () {},
//                                                     margin: getMargin(top: 40)),
//                                               ),
//                                               addVerticalSpacing(250),
//                                             ])),
//                                   ),
//                                 ),
//                                 addVerticalSpacing(250),
//
//                                 FadeBottomTopAnimation(
//                                     key: portfolioKey,
//                                     child:  PortfolioSection(effect: const BlurEffect(),)),
//                                 addVerticalSpacing(250),
//
//                                 FadeBottomTopAnimation(
//                                   key: aboutKey,
//                                   child:  AboutSection(
//                                       name: 'Teewhy',
//                                       photoUrl: Assets.portfolioP1,
//                                       effect: ,
//                                       techStack: [
//                                         'Flutter',
//                                         'Dart',
//                                         'Firebase',
//                                         'Blockchain',
//                                         'Solidity',
//                                         'Smart Contracts',
//                                       ]),
//                                 ),
//                                 addVerticalSpacing(250),
//
//                                 FadeBottomTopAnimation(
//                                     key: contactKey,
//                                     child: const ContactSection()),
//                               ],
//                             ),
//                           ),
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _onDragStart(DragStartDetails details) {
//     bool isDragOpenFromLeft = animationController.isDismissed;
//     bool isDragCloseFromRight = animationController.isCompleted;
//     _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
//   }
//
//   void _onDragUpdate(DragUpdateDetails details) {
//     if (_canBeDragged) {
//       double delta = details.primaryDelta! / maxSlide;
//       animationController.value += delta;
//     }
//   }
//
//   void _onDragEnd(DragEndDetails details) {
//     //I have no idea what it means, copied from Drawer
//     double kMinFlingVelocity = 365.0;
//
//     if (animationController.isDismissed || animationController.isCompleted) {
//       return;
//     }
//     if (details.velocity.pixelsPerSecond.dx.abs() >= kMinFlingVelocity) {
//       double visualVelocity = details.velocity.pixelsPerSecond.dx /
//           MediaQuery.of(context).size.width;
//
//       animationController.fling(velocity: visualVelocity);
//     } else if (animationController.value < 0.5) {
//       animationController.reverse();
//     } else {
//       animationController.forward();
//     }
//   }
// }
