import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/auth/screen/login_screen.dart';

class ForgetPaswordController extends GetxController {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Focus nodes
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isNewPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxString email = ''.obs;
  final RxString verificationCode = ''.obs;

  @override
  void onInit() {
    super.onInit();

    // Get data from previous screen
    final Map<String, dynamic>? args = Get.arguments;
    if (args != null) {
      email.value = args['email'] ?? '';
      verificationCode.value = args['verificationCode'] ?? '';
    }
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.onClose();
  }

  // Toggle new password visibility
  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validate password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  // Validate confirm password
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Change password
  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      // Simulate API call
      // await Future.delayed(const Duration(seconds: 2));

      // final bool success = await ApiService.resetPassword(
      //   email: email.value,
      //   verificationCode: verificationCode.value,
      //   newPassword: newPasswordController.text,
      // );

      // For demo, assume success

      final bool success = true;

      if (success) {
        Get.snackbar(
          'Success',
          'Password changed successfully! You can now sign in with your new password.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.shade100,
          colorText: Colors.green.shade800,
          duration: const Duration(seconds: 4),
        );

        Get.offAll(LoginScreen());

        // Navigate back to login screen
      } else {
        Get.snackbar(
          'Error',
          'Failed to change password. Please try again.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade800,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred while changing your password. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate back
  void navigateBack() {
    Get.back();
  }

  // Clear form
  void clearForm() {
    newPasswordController.clear();
    confirmPasswordController.clear();
    newPasswordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();
  }

  // Check password strength
  int getPasswordStrength(String password) {
    int strength = 0;

    if (password.length >= 6) strength++;
    if (password.length >= 8) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[a-z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

    return strength;
  }

  // Get password strength text
  String getPasswordStrengthText(String password) {
    int strength = getPasswordStrength(password);

    switch (strength) {
      case 0:
      case 1:
        return 'Very Weak';
      case 2:
        return 'Weak';
      case 3:
      case 4:
        return 'Good';
      case 5:
      case 6:
        return 'Strong';
      default:
        return 'Very Weak';
    }
  }

  // Get password strength color
  Color getPasswordStrengthColor(String password) {
    int strength = getPasswordStrength(password);

    switch (strength) {
      case 0:
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
      case 4:
        return Colors.blue;
      case 5:
      case 6:
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}
