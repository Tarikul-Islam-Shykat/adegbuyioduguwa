// controllers/order_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/seller_flow/order_page/model/order_model.dart';

class OrderController extends GetxController {
  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final RxString selectedSortBy = 'Jul, 2024'.obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  void loadOrders() {
    // Sample data
    orders.addAll([
      OrderModel(
        id: '1',
        customerName: 'Tony fartyé kijhijh',
        email: 'abcd@gmail.com',
        orderDate: DateTime.now(),
      ),
      OrderModel(
        id: '2',
        customerName: 'Tony fartyé kijhijh',
        email: 'abcd@gmail.com',
        orderDate: DateTime.now(),
      ),
      OrderModel(
        id: '3',
        customerName: 'Tony fartyé kijhijh',
        email: 'abcd@gmail.com',
        orderDate: DateTime.now(),
      ),
      OrderModel(
        id: '4',
        customerName: 'Tony fartyé kijhijh',
        email: 'abcd@gmail.com',
        orderDate: DateTime.now(),
      ),
      OrderModel(
        id: '5',
        customerName: 'Tony fartyé kijhijh',
        email: 'abcd@gmail.com',
        orderDate: DateTime.now(),
      ),
      OrderModel(
        id: '6',
        customerName: 'Tony fartyé kijhijh',
        email: 'abcd@gmail.com',
        orderDate: DateTime.now(),
      ),
      OrderModel(
        id: '7',
        customerName: 'Tony fartyé kijhijh',
        email: 'abcd@gmail.com',
        orderDate: DateTime.now(),
      ),
    ]);
  }

  void approveOrder(String orderId) {
    final orderIndex = orders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      orders[orderIndex].isApproved = true;
      orders.refresh();
      Get.snackbar(
        'Success',
        'Order approved successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void deleteOrder(String orderId) {
    orders.removeWhere((order) => order.id == orderId);
    Get.snackbar(
      'Deleted',
      'Order deleted successfully',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void updateSortBy(String sortBy) {
    selectedSortBy.value = sortBy;
    // Implement sorting logic here
  }
}
