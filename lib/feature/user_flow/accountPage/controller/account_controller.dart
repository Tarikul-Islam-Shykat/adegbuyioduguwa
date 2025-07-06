import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  late PageController pageController;
  RxInt currentIndex = 0.obs;

  // Page titles for AppBar
  final List<String> titles = [
    'My account',
    'Manage Address',
    'Account Setting',
  ];

  // User data
  RxString userName = 'Steven'.obs;
  RxString userEmail = 'steven@example.com'.obs;
  RxString memberSince = 'Since Oct 2024'.obs;
  RxInt totalOrders = 2.obs;
  RxInt pendingOrders = 2.obs;

  // Account details
  RxString firstName = 'Mohammad'.obs;
  RxString lastName = 'Ashikuzzaman'.obs;
  RxString emailAddress = 'ashik444@gmail.com'.obs;
  RxString password = 'AS@8%FFSRS%76'.obs;

  // Address data
  RxString shippingAddress = ''.obs;
  RxString billingAddress = ''.obs;
  RxBool sameAsShipping = false.obs;

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

  void goToPage(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    if (currentIndex.value < titles.length - 1) {
      goToPage(currentIndex.value + 1);
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      goToPage(currentIndex.value - 1);
    } else {
      Get.back();
    }
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  // Account actions
  void updatePassword() {
    // Update password logic
    Get.snackbar('Success', 'Password updated successfully');
  }

  void updateProfile() {
    // Update profile logic
    Get.snackbar('Success', 'Profile updated successfully');
  }

  void updateAddress(String type) {
    // Update address logic
    Get.snackbar('Success', '$type address updated successfully');
  }

  void trackOrder() {
    // Track order logic
    Get.snackbar('Info', 'Opening order tracking');
  }

  void manageAddress() {
    goToPage(1);
  }

  void accountSettings() {
    goToPage(2);
  }
}
