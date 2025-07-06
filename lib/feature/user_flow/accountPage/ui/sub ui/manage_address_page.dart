import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/user_flow/accountPage/controller/account_controller.dart';
import 'package:prettyrini/feature/user_flow/accountPage/ui/sub%20ui/widget.dart';

class ManageAddressPage extends StatelessWidget {
  final AccountController controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section (same as orders page)
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

            // Shipping Address Section
            normalText(
              text: 'Shipping Address',
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8),
            smallText(
              text: 'Add your preferred shipping address',
              color: Colors.grey[600]!,
            ),
            SizedBox(height: 16),

            _buildAddressCard(
              icon: Icons.location_on_outlined,
              title: 'Address',
              placeholder: 'Write your free shipping zone area',
              value: controller.shippingAddress.value,
              onUpdate: () => controller.updateAddress('Shipping'),
            ),

            SizedBox(height: 30),

            // Billing Address Section
            normalText(
              text: 'Billing Address',
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8),
            smallText(
              text: 'Add your preferred billing address',
              color: Colors.grey[600]!,
            ),
            SizedBox(height: 16),

            _buildAddressCard(
              icon: Icons.location_on_outlined,
              title: 'Address',
              placeholder: 'Write your free shipping zone area',
              value: controller.billingAddress.value,
              onUpdate: () => controller.updateAddress('Billing'),
            ),

            SizedBox(height: 20),

            // Same as shipping address checkbox
            Row(
              children: [
                Obx(() => Checkbox(
                      value: controller.sameAsShipping.value,
                      onChanged: (value) {
                        controller.sameAsShipping.value = value ?? false;
                      },
                      activeColor: AppColors.primaryColor,
                    )),
                Expanded(
                  child: smallText(
                    text: 'Same as shipping address',
                    color: Colors.grey[700]!,
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

  Widget _buildAddressCard({
    required IconData icon,
    required String title,
    required String placeholder,
    required String value,
    required VoidCallback onUpdate,
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
          // Address Icon and Title
          Row(
            children: [
              Icon(
                icon,
                color: Colors.grey[600],
                size: 20,
              ),
              SizedBox(width: 8),
              smallText(
                text: title,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 16),

          // Address Input Field
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: smallText(
              text: value.isEmpty ? placeholder : value,
              color: value.isEmpty ? Colors.grey[500]! : Colors.black,
              maxLines: 3,
            ),
          ),

          SizedBox(height: 16),

          // Update Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onUpdate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.grey[700],
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit, size: 16),
                  SizedBox(width: 8),
                  smallText(
                    text: 'Update',
                    color: Colors.grey[700]!,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
