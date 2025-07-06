import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/user_flow/cart/controller/cart_controller.dart';
import 'package:prettyrini/feature/user_flow/cart/model/cart_item_model.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildCartItems(),
                  _buildCouponSection(),
                  _buildProductSummary(),
                  _buildPaymentInfo(),
                ],
              ),
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0), // Increased height
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF007AFF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                Text(
                  'My cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_outlined,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: headingText(
        text: "Let's Get You Checked Out",
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildCartItems() {
    return Obx(() => ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return _buildCartItemCard(item);
          },
        ));
  }

  Widget _buildCartItemCard(CartItem item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Checkbox
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Icon(
                  Icons.check,
                  size: 14.sp,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(width: 12.w),

              // Product Image
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    ImagePath.product_img_1,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.image,
                          color: Colors.grey[400],
                          size: 30.sp,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    normalText(
                      text: item.name,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    SizedBox(height: 4.h),
                    smallText(
                      text: item.brand,
                      color: Colors.grey[600]!,
                    ),
                    SizedBox(height: 8.h),
                    headingText(
                        text: '\$${item.price.toStringAsFixed(0)}',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuantitySelector(item),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.grey[400]),
                onPressed: () => controller.removeItem(item.id),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 24.w, minHeight: 24.w),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(CartItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => controller.updateQuantity(item.id, item.quantity - 1),
          child: Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(
              Icons.remove,
              size: 16.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
        Container(
          width: 40.w,
          height: 28.w,
          alignment: Alignment.center,
          child: normalText(
            text: item.quantity.toString(),
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () => controller.updateQuantity(item.id, item.quantity + 1),
          child: Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              color: Color(0xFF007AFF),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(
              Icons.add,
              size: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCouponSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // height: 48.h,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                onChanged: controller.updateCouponCode,
                decoration: InputDecoration(
                  hintText: 'Coupon Code',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Obx(() => ElevatedButton(
                onPressed: controller.isLoading ? null : controller.applyCoupon,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF007AFF),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: controller.isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : smallText(
                        text: 'Apply coupon',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
              )),
        ],
      ),
    );
  }

  Widget _buildProductSummary() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          normalText(
            text: 'Product Summary',
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.h),
          Obx(() => Column(
                children: [
                  _buildSummaryRow('Total Price',
                      '\$${controller.subtotal.toStringAsFixed(0)}'),
                  _buildSummaryRow('Total Price (Discount)',
                      '\$${controller.discount.toStringAsFixed(0)}'),
                  _buildSummaryRow('Delivery charge',
                      '\$${controller.deliveryCharge.toStringAsFixed(0)}',
                      isLink: true),
                  _buildSummaryRow(
                      'Tax & Fee', '\$${controller.taxFee.toStringAsFixed(0)}'),
                  Divider(height: 24.h),
                  _buildSummaryRow('Total Price',
                      '\$${controller.totalPrice.toStringAsFixed(0)}',
                      isTotal: true),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isLink = false, bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          smallText(
            text: label,
            color: isLink
                ? Color(0xFF007AFF)
                : (isTotal ? Colors.black : Colors.grey[600]!),
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
          smallText(
            text: value,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        children: [
          _buildInfoSection(
            icon: Icons.verified_user,
            title: 'Sellapy',
            subtitle: 'Sellapy keeps your information and payment safe',
            color: Colors.green,
          ),
          SizedBox(height: 16.h),
          _buildInfoSection(
            icon: Icons.local_shipping,
            title: 'Fast Delivery',
            subtitle:
                '✅ Delivery within 48 hours inside the region\n✅ Inside Dhaka- 20 usd, Outside Dhaka-30\n✅ Refund if items damaged\n✅ Free shipping region ( Dhaka, comilla, Barisal)',
            color: Colors.orange,
          ),
          SizedBox(height: 16.h),
          _buildInfoSection(
            icon: Icons.security,
            title: 'Security and Privacy',
            subtitle: 'Safe payments . Secure personal details',
            color: Colors.blue,
          ),
          SizedBox(height: 16.h),
          _buildPaymentMethods(),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.startsWith("Fast") || title.startsWith("Security")
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          icon,
                          color: color,
                          size: 20.sp,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    normalText(
                      text: title,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              )
            : SizedBox.shrink(),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !(title.startsWith("Fast") || title.startsWith("Security"))
                  ? Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 20.sp,
                      ),
                    )
                  : SizedBox(),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    !(title.startsWith("Fast") || title.startsWith("Security"))
                        ? normalText(
                            text: title,
                            fontWeight: FontWeight.w600,
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 4.h),
                    smallText(
                      text: subtitle,
                      color: Colors.grey[600]!,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.credit_card, color: Colors.blue, size: 20.sp),
              SizedBox(width: 12.w),
              normalText(
                text: 'Safe Payments',
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _buildPaymentIcon('VISA'),
              SizedBox(width: 8.w),
              _buildPaymentIcon('MASTER'),
              SizedBox(width: 8.w),
              _buildPaymentIcon('VISA'),
              SizedBox(width: 8.w),
              _buildPaymentIcon('MASTER'),
              SizedBox(width: 8.w),
              _buildPaymentIcon('PAYPAL'),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.local_shipping, color: Colors.orange, size: 20.sp),
              SizedBox(width: 12.w),
              normalText(
                text: 'Courier services',
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildCourierIcon('PATHAO'),
              SizedBox(width: 8.w),
              _buildCourierIcon('STEADFAST'),
              SizedBox(width: 8.w),
              _buildCourierIcon('DHL'),
            ],
          ),
          SizedBox(height: 12.h),
          smallText(
              text:
                  'With popular payment partners, your personal details are safe.',
              color: Colors.grey[600]!,
              maxLines: 5),
        ],
      ),
    );
  }

  Widget _buildPaymentIcon(String name) {
    return Container(
      width: 40.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: smallerText(
          text: name,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700]!,
        ),
      ),
    );
  }

  Widget _buildCourierIcon(String name) {
    return Container(
      width: 50.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: smallerText(
          text: name,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700]!,
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  normalText(
                    text: 'Subtotal',
                    fontWeight: FontWeight.w600,
                  ),
                  headingText(
                    text: '\$${controller.subtotal.toStringAsFixed(0)}',
                    color: Color(0xFFFF6B35),
                    fontWeight: FontWeight.bold,
                  ),
                ],
              )),
          SizedBox(height: 16.h),
          Obx(() => SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: controller.isLoading
                      ? null
                      : controller.proceedToCheckout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF007AFF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: controller.isLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : normalText(
                          text: 'Checkout',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                ),
              )),
        ],
      ),
    );
  }
}
