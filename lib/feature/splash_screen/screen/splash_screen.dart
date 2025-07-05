import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/widget.dart';
import 'package:prettyrini/core/controller/theme_controller.dart';
import 'package:prettyrini/feature/splash_screen/controller/splash_screen_controller.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/const/image_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashScreenController themeController =
        Get.put(SplashScreenController());

    // var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.w,
              height: 150.h,
              child: Image.asset(
                ImagePath.onBoarding1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // tilte_text_heading("HandToHand"),
          ],
        ),
      ),
    );
  }
}
