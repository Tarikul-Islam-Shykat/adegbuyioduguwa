// lib/screens/product_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/app_bar.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/feature/auth/widget/custom_booton_widget.dart';
import 'package:prettyrini/feature/dashboard/controller/product_controller.dart';
import 'package:prettyrini/feature/dashboard/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final ProductController productController = Get.find<ProductController>();

  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          // Background
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              ImagePath.subscriptionLogo,
              fit: BoxFit.fill,
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                buildAppBar("Jenny"),
                SizedBox(
                  height: 20,
                ),
                _buildProductDetails(),
                // Buy Now Button
                CustomButton(
                  onTap: () {},
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Messaege",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Product Title and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Text(
                        "\$${product.price.toStringAsFixed(0)}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Description",
                //    style: TextStyles.subheading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Text(
                    product.description,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
