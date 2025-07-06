import 'package:get/get.dart';
import 'package:prettyrini/feature/user_flow/cart/model/cart_item_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> _cartItems = <CartItem>[].obs;
  final RxString _couponCode = ''.obs;
  final RxDouble _deliveryCharge = 0.0.obs;
  final RxDouble _taxFee = 0.0.obs;
  final RxDouble _discount = 0.0.obs;
  final RxBool _isLoading = false.obs;

  List<CartItem> get cartItems => _cartItems;
  String get couponCode => _couponCode.value;
  double get deliveryCharge => _deliveryCharge.value;
  double get taxFee => _taxFee.value;
  double get discount => _discount.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  void _loadInitialData() {
    // Sample data - replace with actual data loading
    _cartItems.addAll([
      CartItem(
        id: '1',
        name: 'Green Man Jacket',
        brand: 'North Purwokerto',
        price: 49.0,
        imageUrl: 'assets/images/jacket1.jpg',
        quantity: 1,
      ),
      CartItem(
        id: '2',
        name: 'Green Man Jacket',
        brand: 'North Purwokerto',
        price: 49.0,
        imageUrl: 'assets/images/jacket2.jpg',
        quantity: 1,
      ),
    ]);
  }

  double get subtotal {
    return _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double get totalPrice {
    return subtotal + deliveryCharge + taxFee - discount;
  }

  void updateQuantity(String itemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(itemId);
      return;
    }

    final index = _cartItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _cartItems[index] = _cartItems[index].copyWith(quantity: newQuantity);
      _cartItems.refresh();
    }
  }

  void removeItem(String itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
  }

  void updateCouponCode(String code) {
    _couponCode.value = code;
  }

  void applyCoupon() {
    if (_couponCode.value.isEmpty) return;

    _isLoading.value = true;

    // Simulate API call
    Future.delayed(Duration(seconds: 1), () {
      // Sample coupon logic
      if (_couponCode.value.toUpperCase() == 'SAVE10') {
        _discount.value = subtotal * 0.1; // 10% discount
        Get.snackbar('Success', 'Coupon applied successfully!');
      } else {
        Get.snackbar('Error', 'Invalid coupon code');
      }
      _isLoading.value = false;
    });
  }

  void proceedToCheckout() {
    if (_cartItems.isEmpty) {
      Get.snackbar('Error', 'Your cart is empty');
      return;
    }

    _isLoading.value = true;

    // Simulate checkout process
    Future.delayed(Duration(seconds: 2), () {
      _isLoading.value = false;
      Get.snackbar('Success', 'Order placed successfully!');
      // Navigate to success screen or clear cart
      // Get.toNamed('/order-success');
    });
  }
}
