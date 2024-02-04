import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    this.carouselController,
    required this.itemCount,
    required this.itemBuilder,
    this.viewportFraction = 1,
    this.initialPage = 0,
    this.onPageChanged,
    this.height,
    this.enableInfiniteScroll = false,
  });
  final CarouselController? carouselController;
  final int? itemCount;
  final Widget Function(BuildContext, int, int) itemBuilder;
  final double viewportFraction;
  final int initialPage;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final double? height;
  final bool enableInfiniteScroll;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        initialPage: initialPage,
        onPageChanged: onPageChanged,
        height: height ?? double.maxFinite,
        padEnds: false,
        viewportFraction: viewportFraction,
        enableInfiniteScroll: enableInfiniteScroll,
      ),
    );
  }
}
