import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/user_flow/accountPage/controller/account_controller.dart';
import 'package:prettyrini/feature/user_flow/accountPage/ui/sub%20ui/account_details_page.dart';
import 'package:prettyrini/feature/user_flow/accountPage/ui/sub%20ui/manage_address_page.dart';
import 'package:prettyrini/feature/user_flow/accountPage/ui/sub%20ui/orders_page.dart';

class AccountMainPage extends StatelessWidget {
  final AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
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
              toolbarHeight: 80.0,
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
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            // Tab Navigation
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //   child: Row(
            //     children: [
            //       _buildTabButton(0, 'Track\nOrder', Icons.local_shipping),
            //       _buildTabButton(1, 'Manage\nAddress', Icons.location_on),
            //       _buildTabButton(2, 'Account\nSetting', Icons.settings),
            //     ],
            //   ),
            // ),
            // Page View
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: [
                  OrdersPage(),
                  ManageAddressPage(),
                  AccountDetailsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
