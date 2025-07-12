// models/order_model.dart
class OrderModel {
  final String id;
  final String customerName;
  final String email;
  final DateTime orderDate;
  bool isApproved;
  bool isDeleted;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.email,
    required this.orderDate,
    this.isApproved = false,
    this.isDeleted = false,
  });
}
