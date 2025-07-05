import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Observable variables
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var rememberMe = false.obs;

  // Focus nodes
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    emailController.text = '';
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    fullNameController.dispose();
    confirmPasswordController.dispose();
    nameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle remember me
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // Validate email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Validate password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Sign in with email and password
  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Your sign-in logic here
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      print('Email: $email');
      print('Password: $password');
      print('Remember Me: ${rememberMe.value}');

      // Navigate to home screen on success
      Get.offAllNamed('/home');

      // Show success message
      Get.snackbar(
        'Success',
        'Welcome back!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Handle error
      Get.snackbar(
        'Error',
        'Failed to sign in. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      // Simulate Google sign-in
      await Future.delayed(const Duration(seconds: 1));

      // Your Google sign-in logic here
      print('Google Sign In');

      // Navigate to home screen on success
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Google sign-in failed. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook() async {
    try {
      isLoading.value = true;

      // Simulate Facebook sign-in
      await Future.delayed(const Duration(seconds: 1));

      // Your Facebook sign-in logic here
      print('Facebook Sign In');

      // Navigate to home screen on success
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Facebook sign-in failed. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Sign in with Apple
  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;

      // Simulate Apple sign-in
      await Future.delayed(const Duration(seconds: 1));

      // Your Apple sign-in logic here
      print('Apple Sign In');

      // Navigate to home screen on success
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Apple sign-in failed. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate to sign up
  void navigateToSignUp() {
    Get.toNamed('/signup');
  }

  // Navigate to forgot password
  void navigateToForgotPassword() {
    Get.toNamed('/forgot-password');
  }

  // Navigate to create new account
  void navigateToCreateAccount() {
    Get.toNamed('/create-account');
  }
}
