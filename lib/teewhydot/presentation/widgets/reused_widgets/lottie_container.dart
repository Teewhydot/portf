import 'package:flutter/material.dart';

class LottieBackgroundContainer extends StatelessWidget {
  final String animationAsset;
  final Widget child;

  const LottieBackgroundContainer({
    Key? key,
    required this.animationAsset,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// TODO Use another background
        // Lottie.asset(
        //   animate: true,
        //   repeat: true,
        //   animationAsset,
        //   fit: BoxFit.cover,
        //   width: 500,
        //   height: 700,
        // ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ],
    );
  }
}
