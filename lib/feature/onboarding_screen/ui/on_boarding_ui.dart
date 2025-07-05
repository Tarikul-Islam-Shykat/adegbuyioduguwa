import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/onboarding_screen/ui/on_boarding_ui_content.dart';

import '../controller/on_boarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo and skip button
            // Padding(
            //   padding: EdgeInsets.all(20.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       // Logo
            //       Image.asset(
            //         ImagePath.appLogo,
            //         height: 32.h,
            //         width: 120.w,
            //         fit: BoxFit.contain,
            //       ),
            //       // Skip button
            //     ],
            //   ),
            // ),
            // Image.asset(
            //   ImagePath.appLogo,
            //   height: 32.h,
            //   width: 120.w,
            //   fit: BoxFit.contain,
            // ),

            // PageView with content
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageContent(
                    content: controller.onboardingPages[index],
                  );
                },
              ),
            ),

            // Bottom section with dots and next button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  // Dot indicators
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.onboardingPages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            height: 8.h,
                            width: controller.currentIndex.value == index
                                ? 24.w
                                : 8.w,
                            decoration: BoxDecoration(
                              color: controller.currentIndex.value == index
                                  ? const Color(0xFF007AFF)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                      )),

                  SizedBox(height: 30.h),

                  // Next button
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: controller.skipOnboarding,
                            child: normalText(
                              text: 'Skip',
                            ),
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: controller.nextPage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF007AFF),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                elevation: 0,
                              ),
                              child: normalText(
                                  text: controller.currentIndex.value ==
                                          controller.onboardingPages.length - 1
                                      ? 'Get Started'
                                      : 'Next',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
