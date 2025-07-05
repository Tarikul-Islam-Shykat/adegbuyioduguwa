import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/feature/auth/screen/login_screen.dart';
import 'package:prettyrini/feature/onboarding_screen/model/on_boarding_ui_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;

  final List<OnboardingContent> onboardingPages = [
    OnboardingContent(
      image: ImagePath.onBoarding1, // Replace with your image path
      title: 'Your Favorite Brands,\nJust a Tap Away',
      description:
          'Discover amazing products from your favorite brands. Shop anytime, anywhere, without leaving your home.',
    ),
    OnboardingContent(
      image: ImagePath.onBoarding2, // Replace with your image path
      title: 'Fast & Secure\nDelivery',
      description:
          'Get your orders delivered quickly and securely. Track your package in real-time from order to doorstep.',
    ),
    OnboardingContent(
      image: ImagePath.onBoarding3, // Replace with your image path
      title: 'Exclusive Deals\n& Offers',
      description:
          'Access exclusive deals and special offers. Save money while shopping for your favorite products.',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentIndex.value < onboardingPages.length - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding();
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
    Get.to(LoginScreen());
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
