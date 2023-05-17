// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class WavingHand extends StatefulWidget {
  const WavingHand({super.key});

  @override
  _WavingHandState createState() => _WavingHandState();
}

class _WavingHandState extends State<WavingHand>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..repeat();
    _waveAnimation = Tween<double>(begin: 0.5, end: -0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _waveAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _waveAnimation.value,
          child: const Text(
            '🖖',
            style: TextStyle(fontSize: 50),
          ),
        );
      },
    );
  }
}
