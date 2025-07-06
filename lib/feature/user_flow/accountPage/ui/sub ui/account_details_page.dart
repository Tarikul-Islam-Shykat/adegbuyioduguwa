import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/user_flow/accountPage/controller/account_controller.dart';
import 'package:prettyrini/feature/user_flow/accountPage/ui/sub%20ui/widget.dart';

class AccountDetailsPage extends StatelessWidget {
  final AccountController controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section (same as other pages)
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(ImagePath.goalkipper),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // User Name
                  Obx(() => headingText(
                        text: 'Hello, ${controller.userName.value}!',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 4),
                  // Member Since
                  Obx(() => smallText(
                        text: 'Member\n${controller.memberSince.value}',
                        color: Colors.grey[600]!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      )),
                  SizedBox(height: 20),
                  // Order Stats
                  Row(
                    children: [
                      Expanded(
                        child: _buildOrderStat(
                          icon: Icons.shopping_bag_outlined,
                          count: controller.totalOrders.value,
                          label: 'Orders',
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.grey[300],
                      ),
                      Expanded(
                        child: _buildOrderStat(
                          icon: Icons.pending_outlined,
                          count: controller.pendingOrders.value,
                          label: 'Orders',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        buildTabButton(0, 'Track\nOrder', Icons.local_shipping,
                            controller),
                        buildTabButton(1, 'Manage\nAddress', Icons.location_on,
                            controller),
                        buildTabButton(
                            2, 'Account\nSetting', Icons.settings, controller),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Account Details Section
            normalText(
              text: 'Account details',
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8),
            smallText(
              text: 'Update your account details or visit only here',
              color: Colors.grey[600]!,
            ),
            SizedBox(height: 24),

            // First Name
            _buildDetailField(
              label: 'First name',
              value: controller.firstName.value,
            ),
            SizedBox(height: 20),

            // Last Name
            _buildDetailField(
              label: 'Last name',
              value: controller.lastName.value,
            ),
            SizedBox(height: 20),

            // Email Address
            _buildDetailField(
              label: 'Email address',
              value: controller.emailAddress.value,
            ),
            SizedBox(height: 20),

            // Password
            _buildDetailField(
              label: 'Password',
              value: controller.password.value,
              isPassword: true,
              hasUpdateButton: true,
              onUpdate: () => controller.updatePassword(),
            ),
            SizedBox(height: 40),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.grey[700],
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: normalText(
                      text: 'Cancel',
                      color: Colors.grey[700]!,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.updateProfile(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: normalText(
                      text: 'Save',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStat({
    required IconData icon,
    required int count,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey,
                size: 24,
              ),
              SizedBox(width: 8),
              normalText(
                text: count.toString(),
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 4),
              smallText(
                text: label,
                color: Colors.grey[600]!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailField({
    required String label,
    required String value,
    bool isPassword = false,
    bool hasUpdateButton = false,
    VoidCallback? onUpdate,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          smallText(
            text: label,
            color: Colors.grey[600]!,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 8),

          // Value
          Row(
            children: [
              Expanded(
                child: smallText(
                  text: isPassword ? '•' * value.length : value,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (hasUpdateButton)
                TextButton(
                  onPressed: onUpdate,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                  ),
                  child: smallText(
                    text: 'Update Password',
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
