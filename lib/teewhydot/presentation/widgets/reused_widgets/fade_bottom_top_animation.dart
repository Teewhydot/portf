// ignore_for_file: file_names, overridden_fields

import 'package:flutter/material.dart';

class FadeBottomTopAnimation extends StatefulWidget {
  final Widget child;
  @override
  final Key key;

  const FadeBottomTopAnimation({required this.child, required this.key});

  @override
  State<FadeBottomTopAnimation> createState() => _FadeBottomTopAnimationState();
}

class _FadeBottomTopAnimationState extends State<FadeBottomTopAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  double position = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    onInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showWidget() {
    setState(() {
      position = 1;
      _controller.forward();
    });
  }

  void hideWidget() {
    setState(() {
      position = -1;
      _controller.reverse();
    });
  }

  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 40), () {
      showWidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            30 * position * (1 - _controller.value),
          ),
          child: Opacity(opacity: _animation.value, child: child),
        );
      },
    );
  }
}
