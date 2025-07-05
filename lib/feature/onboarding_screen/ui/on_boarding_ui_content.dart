import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/onboarding_screen/model/on_boarding_ui_model.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingContent content;

  const OnboardingPageContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Flexible space at top
          SizedBox(height: 20.h),

          // Main image container
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxHeight: 300.h,
                minHeight: 200.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  content.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Content section
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),

                // Title
                headingText(text: content.title),
                SizedBox(height: 5.h),
                normalText(
                    text: content.description,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    color: Colors.grey)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Alternative layout for smaller screens
class OnboardingPageContentCompact extends StatelessWidget {
  final OnboardingContent content;

  const OnboardingPageContentCompact({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            // Main image
            Container(
              height: 250.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  content.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 40.h),

            // Title
            Text(
              content.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.2,
              ),
            ),

            SizedBox(height: 16.h),

            // Description
            Text(
              content.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),

            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}

// Smart content widget that adapts to screen size
class AdaptiveOnboardingContent extends StatelessWidget {
  final OnboardingContent content;

  const AdaptiveOnboardingContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use compact layout for smaller screens
    if (1.sh < 700) {
      return OnboardingPageContentCompact(content: content);
    }

    // Use regular layout for larger screens
    return OnboardingPageContent(content: content);
  }
}
