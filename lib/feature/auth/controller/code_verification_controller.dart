import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/auth/screen/forget_pasword_screen.dart';

class CodeVerificationController extends GetxController {
  // PIN Controllers and Focus Nodes
  List<TextEditingController> pinControllers = [];
  List<FocusNode> pinFocusNodes = [];

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isResendLoading = false.obs;
  final RxString email = ''.obs;
  final RxString expiryTime = '5:00'.obs;

  // Timer for countdown
  Timer? _countdownTimer;
  int _countdownSeconds = 300; // 5 minutes

  @override
  void onInit() {
    super.onInit();

    // Initialize PIN controllers and focus nodes
    for (int i = 0; i < 4; i++) {
      pinControllers.add(TextEditingController());
      pinFocusNodes.add(FocusNode());
    }

    // Get email from previous screen
    final String? emailFromArgs = Get.arguments?['email'];
    if (emailFromArgs != null) {
      email.value = emailFromArgs;
    }

    // Start countdown timer
    _startCountdown();
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    for (var controller in pinControllers) {
      controller.dispose();
    }
    for (var focusNode in pinFocusNodes) {
      focusNode.dispose();
    }
    _countdownTimer?.cancel();
    super.onClose();
  }

  // Handle PIN input changes
  void onPinChanged(int index, String value) {
    if (value.isNotEmpty) {
      // Move to next field if not the last one
      if (index < 3) {
        pinFocusNodes[index + 1].requestFocus();
      } else {
        // If last field, unfocus to hide keyboard
        pinFocusNodes[index].unfocus();
      }
    } else {
      // Move to previous field if not the first one
      if (index > 0) {
        pinFocusNodes[index - 1].requestFocus();
      }
    }
  }

  // Get complete PIN code
  String get pinCode {
    return pinControllers.map((controller) => controller.text).join();
  }

  // Verify the PIN code
  Future<void> verifyCode() async {
    if (pinCode.length != 4) {
      Get.snackbar(
        'Invalid Code',
        'Please enter the complete 4-digit code',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    try {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with actual API call
      // final bool isValid = await ApiService.verifyCode(email.value, pinCode);

      // For demo, assume code is valid if it's "1234"
      final bool isValid = pinCode == "1234";

      if (isValid) {
        Get.snackbar(
          'Success',
          'Code verified successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.shade100,
          colorText: Colors.green.shade800,
          duration: const Duration(seconds: 3),
        );

        Get.to(ForgetPaswordScreen());

        // Navigate to reset password screen
        // Get.toNamed('/reset-password', arguments: {
        //   'email': email.value,
        //   'verificationCode': pinCode,
        // });
      } else {
        Get.snackbar(
          'Invalid Code',
          'The verification code you entered is incorrect',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade800,
          duration: const Duration(seconds: 3),
        );

        // Clear PIN fields
        clearPinFields();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to verify code. Please try again.',
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
      // await ApiService.resendVerificationCode(email.value);

      // Clear PIN fields and restart countdown
      clearPinFields();
      _startCountdown();

      Get.snackbar(
        'Code Resent',
        'New verification code has been sent to ${email.value}',
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

  // Clear all PIN fields
  void clearPinFields() {
    for (var controller in pinControllers) {
      controller.clear();
    }
    pinFocusNodes[0].requestFocus();
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
        // Code expired, navigate back or show expired message
        Get.snackbar(
          'Code Expired',
          'The verification code has expired. Please request a new one.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.orange.shade800,
          duration: const Duration(seconds: 3),
        );
        expiryTime.value = '0:00';
      }
    });
  }

  // Navigate back
  void navigateBack() {
    Get.back();
  }

  // Auto-fill PIN for testing (remove in production)
  void autoFillTestCode() {
    pinControllers[0].text = '1';
    pinControllers[1].text = '2';
    pinControllers[2].text = '3';
    pinControllers[3].text = '4';
  }
}
