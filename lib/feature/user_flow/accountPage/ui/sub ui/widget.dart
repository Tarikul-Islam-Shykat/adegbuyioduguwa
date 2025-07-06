import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/user_flow/accountPage/controller/account_controller.dart';

Widget buildTabButton(
    int index, String title, IconData icon, AccountController controller) {
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
