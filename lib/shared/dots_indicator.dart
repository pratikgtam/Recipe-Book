import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.dotsCount,
    required this.position,
  });
  final int dotsCount;
  final int position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      decorator: DotsDecorator(
        activeSize: const Size(32, 8),
        size: const Size(8, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      position: position,
    );
  }
}
