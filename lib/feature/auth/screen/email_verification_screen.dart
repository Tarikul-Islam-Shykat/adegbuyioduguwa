import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/auth/controller/email_verification_controller.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailVerificationController controller =
        Get.put(EmailVerificationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          //  physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180.h,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Back button
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: controller.navigateBack,
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headingTextV2(
                                text: 'Enter your email', color: Colors.white),
                            SizedBox(height: 8.h),
                            smallText(
                                text:
                                    'Forgot your password? No worries—enter your email to reset it and get back to shopping!',
                                color: Colors.white,
                                maxLines: 3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content Section

              Padding(
                padding: EdgeInsets.all(20.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),

                      // Email input field
                      TextFormField(
                        controller: controller.emailController,
                        focusNode: controller.emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        validator: controller.validateEmail,
                        onFieldSubmitted: (_) {
                          controller.sendVerificationCode();
                        },
                        decoration: InputDecoration(
                          hintText: 'careersapp@gmail.com',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 20.sp,
                            color: Colors.grey,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Color(0xFF1976D2),
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Obx(() => controller.isCodeSent.value
                      //     ?
                      Column(
                        children: [
                          smallText(
                            text: 'Code was send to your email',
                            color: Colors.black87,
                            maxLines: 1,
                          ),
                          SizedBox(height: 4.h),
                          normalText(
                            text: controller.emailController.text,
                            color: Colors.black,
                          ),
                          SizedBox(height: 16.h),
                          Obx(() => smallText(
                                text:
                                    'This code will expire on ${controller.expiryTime.value} minutes',
                                color: Colors.grey.shade600,
                                maxLines: 1,
                              )),
                        ],
                      ),
                      // : Container()),
                      SizedBox(height: 32.h),

                      // // Send Code Button
                      //  Obx(() =>
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.sendVerificationCode,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1976D2),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 0,
                            disabledBackgroundColor: Colors.grey.shade300,
                          ),
                          child: controller.isLoading.value
                              ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Send code',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                      //),

                      SizedBox(height: 16.h),

                      // Obx(() => controller.isCodeSent.value
                      //     ?

                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: controller.isResendLoading.value
                              ? null
                              : controller.resendCode,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 0,
                            disabledBackgroundColor: Colors.grey.shade300,
                          ),
                          child: controller.isResendLoading.value
                              ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Resend code',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      )
                      //  : Container()),

                      // SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
