import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/seller_flow/order_page/controller/order_controller.dart'
    show OrderController;
import 'package:prettyrini/feature/seller_flow/order_page/widget/order_list_item.dart';

class OrderListScreen extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());

  OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_upload_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Order list',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Sort by',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Obx(() => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 16, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                controller.selectedSortBy.value,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.keyboard_arrow_down,
                                  size: 16, color: Colors.grey),
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          // List Header
          Container(
            color: Colors.grey[200],
            child: Stack(
              children: [
                // Scrollable header content
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        // ID Column
                        SizedBox(
                          width: 60,
                          child: Text(
                            'ID',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Customer Name Column
                        SizedBox(
                          width: 180,
                          child: Text(
                            'Customer name',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Email Column
                        SizedBox(
                          width: 200,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Order Date Column
                        SizedBox(
                          width: 120,
                          child: Text(
                            'Order Date',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Status Column
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 100),
                      ],
                    ),
                  ),
                ),
                // Fixed Actions Header
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    color: Colors.grey[200],
                    child: const Text(
                      'Actions',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Order List
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    final order = controller.orders[index];
                    return OrderListItem(
                      order: order,
                      onApprove: () => controller.approveOrder(order.id),
                      onDelete: () => controller.deleteOrder(order.id),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
