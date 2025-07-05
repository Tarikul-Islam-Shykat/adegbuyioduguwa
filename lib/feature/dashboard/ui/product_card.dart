// lib/widgets/product_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/feature/dashboard/controller/product_controller.dart';
import 'package:prettyrini/feature/dashboard/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // Product info
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${product.price.toStringAsFixed(0)}",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     // Obx(() {
                  //     //   final currentProduct = productController.products
                  //     //       .firstWhere((p) => p.id == product.id);
                  //     //   return InkWell(
                  //     //     onTap: () =>
                  //     //         productController.toggleFavorite(product.id),
                  //     //     child: Icon(
                  //     //       currentProduct.isFavorite
                  //     //           ? Icons.favorite
                  //     //           : Icons.favorite_border,
                  //     //       color: currentProduct.isFavorite
                  //     //           ? Colors.red
                  //     //           : AppColors.primaryColor,
                  //     //       size: 20,
                  //     //     ),
                  //     //   );
                  //     // })
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
