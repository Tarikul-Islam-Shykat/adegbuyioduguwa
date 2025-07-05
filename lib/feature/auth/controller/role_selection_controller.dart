import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserRole { buyer, seller }

class RoleSelectionController extends GetxController {
  // Observable variables
  var selectedRole = Rx<UserRole?>(null);
  var isLoading = false.obs;

  // Role data
  final List<RoleOption> roleOptions = [
    RoleOption(
      role: UserRole.buyer,
      title: 'Continue as a Buyer',
      description:
          'Create an account or sign in to start shopping your favorite products with ease.',
      icon: Icons.shopping_cart_outlined,
      color: const Color(0xFF4CAF50),
    ),
    RoleOption(
      role: UserRole.seller,
      title: 'Continue as a Seller',
      description:
          'Set up your store and start selling your products to customers worldwide.',
      icon: Icons.store_outlined,
      color: const Color(0xFF2196F3),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Check if user has previously selected a role
    _loadSavedRole();
  }

  // Load previously saved role
  Future<void> _loadSavedRole() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedRole = prefs.getString('user_role');

      if (savedRole != null) {
        if (savedRole == 'buyer') {
          selectedRole.value = UserRole.buyer;
        } else if (savedRole == 'seller') {
          selectedRole.value = UserRole.seller;
        }
      }
    } catch (e) {
      print('Error loading saved role: $e');
    }
  }

  // Select a role
  void selectRole(UserRole role) {
    selectedRole.value = role;

    // Provide haptic feedback
    _provideHapticFeedback();
  }

  // Provide haptic feedback
  void _provideHapticFeedback() {
    // You can add haptic feedback here if needed
    // HapticFeedback.lightImpact();
  }

  // Continue with selected role
  Future<void> continueWithSelectedRole() async {
    if (selectedRole.value == null) {
      _showErrorMessage('Please select a role to continue');
      return;
    }

    try {
      isLoading.value = true;

      // Save selected role
      await _saveSelectedRole();

      // Simulate API call or processing
      await Future.delayed(const Duration(seconds: 1));

      // Navigate based on selected role
      if (selectedRole.value == UserRole.buyer) {
        _navigateToBuyerFlow();
      } else {
        _navigateToSellerFlow();
      }

      _showSuccessMessage('Role selected successfully!');
    } catch (e) {
      _showErrorMessage('Failed to continue. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  // Save selected role to SharedPreferences
  Future<void> _saveSelectedRole() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String roleString =
          selectedRole.value == UserRole.buyer ? 'buyer' : 'seller';
      await prefs.setString('user_role', roleString);
    } catch (e) {
      print('Error saving selected role: $e');
    }
  }

  // Navigate to buyer flow
  void _navigateToBuyerFlow() {
    Get.offAllNamed('/buyer/home');
  }

  // Navigate to seller flow
  void _navigateToSellerFlow() {
    Get.offAllNamed('/seller/dashboard');
  }

  // Skip role selection (optional)
  void skipRoleSelection() {
    Get.offAllNamed('/main/home');
  }

  // Show error message
  void _showErrorMessage(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.shade400,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  // Show success message
  void _showSuccessMessage(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.shade400,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }

  // Get role option by role
  RoleOption getRoleOption(UserRole role) {
    return roleOptions.firstWhere((option) => option.role == role);
  }

  // Check if role is selected
  bool isRoleSelected(UserRole role) {
    return selectedRole.value == role;
  }

  // Get continue button text
  String get continueButtonText {
    if (isLoading.value) return 'Please wait...';
    return 'Continue';
  }

  // Check if continue button should be enabled
  bool get isContinueButtonEnabled {
    return selectedRole.value != null && !isLoading.value;
  }
}

// Role option model
class RoleOption {
  final UserRole role;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  RoleOption({
    required this.role,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
