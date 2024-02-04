import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/features/onboarding/models/onboarding_model.dart';
import 'package:recipe_book/shared/app_assets.dart';
import 'package:recipe_book/shared/custom_carousel.dart';
import 'package:recipe_book/shared/custom_scaffold.dart';
import 'package:recipe_book/shared/dots_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  CarouselController carouselController = CarouselController();
  int _carouselIndex = 0;
  final List<OnboardingModel> _onboardingContents = [
    OnboardingModel(
      title: 'Welcome to Recipe Book!',
      description:
          "Explore a world of flavors and turn your kitchen into a haven of delicious creations with personalized recommendations.",
      image: AppAssets.onboard1,
    ),
    OnboardingModel(
      title: 'Discover Mouthwatering Recipes',
      description:
          "Whether you're a seasoned chef or a kitchen novice, find the perfect recipe to satisfy your taste buds and elevate your culinary skills.",
      image: AppAssets.onboard2,
    ),
    OnboardingModel(
      title: 'Personalized Cooking Experience',
      description:
          "Tailor your culinary adventure with Recipe books's personalized recommendations. Save favorites, create shopping lists, and track your cooking journey.",
      image: AppAssets.onboard3,
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: CustomDotsIndicator(
              dotsCount: 3,
              position: _carouselIndex,
            ),
          ),
        ],
      ),
      body: CustomCarousel(
        carouselController: carouselController,
        itemCount: 3,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index, realIndex) {
          final onboardingContent = _onboardingContents[index];
          return Column(
            children: [
              Text(
                onboardingContent.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(onboardingContent.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                onboardingContent.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onPageChanged(int index, _) {
    setState(() {
      _carouselIndex = index;
    });
  }
}
