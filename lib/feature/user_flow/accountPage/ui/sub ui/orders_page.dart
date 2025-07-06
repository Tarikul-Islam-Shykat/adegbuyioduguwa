import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/user_flow/accountPage/controller/account_controller.dart';
import 'package:prettyrini/feature/user_flow/accountPage/ui/sub%20ui/widget.dart';

class OrdersPage extends StatelessWidget {
  final AccountController controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // User Profile Section
          Container(
            margin: EdgeInsets.all(20),
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
                      image: AssetImage(
                          ImagePath.goalkipper), // Replace with actual image
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
                      buildTabButton(
                          0, 'Track\nOrder', Icons.local_shipping, controller),
                      buildTabButton(
                          1, 'Manage\nAddress', Icons.location_on, controller),
                      buildTabButton(
                          2, 'Account\nSetting', Icons.settings, controller),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Orders Section
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingText(
                  text: 'Orders (${controller.totalOrders.value})',
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 16),

                // Order List
                _buildOrderItem(
                  orderId: '#5DGT1234FD',
                  payment: '\$90',
                  date: '29 July 2024',
                  items: [
                    OrderItemData(
                      name: 'Green Man Jacket',
                      quantity: '1 pcs',
                      image: 'assets/images/jacket1.png',
                    ),
                    OrderItemData(
                      name: 'Green Man Jacket',
                      quantity: '1 pcs',
                      image: 'assets/images/jacket2.png',
                    ),
                  ],
                  status: 'Accepted',
                ),

                SizedBox(height: 20),

                _buildOrderItem(
                  orderId: '#5DGT1234FD',
                  payment: '\$90',
                  date: '29 July 2024',
                  items: [
                    OrderItemData(
                      name: 'Green Man Jacket',
                      quantity: '1 pcs',
                      image: 'assets/images/jacket1.png',
                    ),
                    OrderItemData(
                      name: 'Green Man Jacket',
                      quantity: '1 pcs',
                      image: 'assets/images/jacket2.png',
                    ),
                  ],
                  status: 'Processing',
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
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

  Widget _buildOrderItem({
    required String orderId,
    required String payment,
    required String date,
    required List<OrderItemData> items,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          // Order Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  smallText(
                    text: 'Order ID',
                    color: Colors.grey[600]!,
                  ),
                  smallText(
                    text: orderId,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  smallText(
                    text: 'Payment',
                    color: Colors.grey[600]!,
                  ),
                  smallText(
                    text: payment,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  smallText(
                    text: 'Order Date',
                    color: Colors.grey[600]!,
                  ),
                  smallText(
                    text: date,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16),

          // Order Items
          ...items
              .map((item) => Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.checkroom,
                            color: Colors.grey[600],
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              smallText(
                                text: item.name,
                                fontWeight: FontWeight.w500,
                              ),
                              smallText(
                                text: item.quantity,
                                color: Colors.grey[600]!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),

          SizedBox(height: 16),

          // Status
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: status == 'Accepted'
                  ? Colors.green.withOpacity(0.1)
                  : Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: smallText(
              text: status == 'Accepted'
                  ? 'Your Order has been Accepted'
                  : 'Processing',
              color: status == 'Accepted' ? Colors.green : Colors.orange,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
/*
  Widget _buildTabButton(int index, String title, IconData icon) {
    return Obx(() {
      bool isActive = controller.currentIndex.value == index;

      return Expanded(
        child: GestureDetector(
          onTap: () => controller.goToPage(index),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isActive ? AppColors.primaryColor : Colors.grey[300]!,
                width: 1,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isActive ? Colors.white : AppColors.primaryColor,
                  size: 20,
                ),
                SizedBox(height: 4),
                smallText(
                  text: title,
                  color: isActive ? Colors.white : AppColors.primaryColor,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

*/
}

class OrderItemData {
  final String name;
  final String quantity;
  final String image;

  OrderItemData({
    required this.name,
    required this.quantity,
    required this.image,
  });
}
