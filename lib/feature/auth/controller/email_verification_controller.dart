import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/auth/screen/code_verification_screen.dart';
import 'package:prettyrini/feature/auth/screen/otp_very_screen.dart';

class EmailVerificationController extends GetxController {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController emailController = TextEditingController();

  // Focus nodes
  final FocusNode emailFocusNode = FocusNode();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isResendLoading = false.obs;
  final RxBool isCodeSent = false.obs;
  final RxString expiryTime = '5'.obs;

  // Timer for countdown
  Timer? _countdownTimer;
  int _countdownSeconds = 300; // 5 minutes

  @override
  void onInit() {
    super.onInit();
    // You can pre-fill email if passed from previous screen
    final String? email = Get.arguments?['email'];
    if (email != null) {
      emailController.text = email;
    }
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    emailController.dispose();
    emailFocusNode.dispose();
    _countdownTimer?.cancel();
    super.onClose();
  }

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Send verification code
  Future<void> sendVerificationCode() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;
      Get.to(CodeVerificationScreen());

      // Simulate API call
      // await Future.delayed(const Duration(seconds: 2));

      isCodeSent.value = true;
      //   _startCountdown();

      Get.snackbar(
        'Code Sent',
        'Verification code has been sent to ${emailController.text}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade100,
        colorText: Colors.green.shade800,
        duration: const Duration(seconds: 3),
      );
      //  Get.to(OtpVeryScreen());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send verification code. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Resend verification code
  Future<void> resendCode() async {
    try {
      isResendLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with actual API call
      // await ApiService.resendVerificationCode(emailController.text);

      _startCountdown();

      Get.snackbar(
        'Code Resent',
        'New verification code has been sent to ${emailController.text}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade100,
        colorText: Colors.green.shade800,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to resend verification code. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isResendLoading.value = false;
    }
  }

  // Start countdown timer
  void _startCountdown() {
    _countdownSeconds = 300; // Reset to 5 minutes
    _countdownTimer?.cancel();

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdownSeconds > 0) {
        _countdownSeconds--;
        int minutes = _countdownSeconds ~/ 60;
        int seconds = _countdownSeconds % 60;
        expiryTime.value = '$minutes:${seconds.toString().padLeft(2, '0')}';
      } else {
        timer.cancel();
        isCodeSent.value = false;
        expiryTime.value = '5';
      }
    });
  }

  // Navigate back
  void navigateBack() {
    Get.back();
  }

  // Navigate to code verification screen
  void navigateToCodeVerification() {
    Get.toNamed('/code-verification', arguments: {
      'email': emailController.text,
    });
  }
}
