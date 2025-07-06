import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/user_flow/checkOut/controller/checkout_controller.dart';
import 'package:prettyrini/feature/user_flow/checkOut/ui/sub_ui/payment_page.dart';
import 'package:prettyrini/feature/user_flow/checkOut/ui/sub_ui/shipping_page.dart';
import 'package:prettyrini/feature/user_flow/checkOut/ui/sub_ui/sucess_page.dart';

class CheckoutFlow extends StatelessWidget {
  final CheckoutController controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Increased height
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 80.0, // Match the preferred size
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                onPressed: () => controller.previousPage(),
              ),
              title: Obx(() => Text(
                    controller.titles[controller.currentIndex.value],
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  )),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_outlined,
                      color: Colors.white, size: 24),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined,
                      color: Colors.white, size: 24),
                  onPressed: () {},
                ),
                SizedBox(width: 8), // Add some padding from the edge
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            // Progress Indicator with clickable buttons
            Container(
              //   color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  _buildProgressStep(0, 'Shipping', Icons.local_shipping),
                  _buildProgressConnector(0),
                  _buildProgressStep(1, 'Payment', Icons.payment),
                  _buildProgressConnector(1),
                  _buildProgressStep(2, 'Confirm', Icons.check_circle),
                ],
              ),
            ),
            // Page View
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: [
                  ShippingPage(onContinue: controller.nextPage),
                  PaymentPage(onContinue: controller.nextPage),
                  ConfirmationPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(int index, String title, IconData icon) {
    return Obx(() {
      bool isActive = controller.currentIndex.value == index;
      bool isCompleted = controller.currentIndex.value > index;
      bool canNavigate = index <= controller.currentIndex.value || isCompleted;

      return GestureDetector(
        onTap: canNavigate ? () => controller.goToPage(index) : null,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isCompleted ? Colors.green : Colors.grey,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive ? Colors.blue : Colors.grey,
                size: 20,
              ),
              SizedBox(width: 5),
              smallText(
                text: title,
                color: isActive ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildProgressConnector(int index) {
    return Obx(() => Expanded(
          child: Container(
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: controller.currentIndex.value > index
                  ? Colors.green
                  : Colors.grey,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ));
  }
}
