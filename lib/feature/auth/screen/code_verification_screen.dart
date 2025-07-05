import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/auth/controller/code_verification_controller.dart';

class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CodeVerificationController controller =
        Get.put(CodeVerificationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Header Section
                  Container(
                    width: double.infinity,
                    height: 200.h,
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

                        // Title and subtitle
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                headingTextV2(
                                    text: 'Forgot password',
                                    color: Colors.white),
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),

                          // PIN Input Fields
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                child: SizedBox(
                                  width: 60.w,
                                  height: 60.h,
                                  child: TextFormField(
                                    controller:
                                        controller.pinControllers[index],
                                    focusNode: controller.pinFocusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      counterText: '',
                                      filled: true,
                                      fillColor: Colors.grey.shade100,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF1976D2),
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      controller.onPinChanged(index, value);
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),

                          SizedBox(height: 30.h),

                          // Status message
                          Column(
                            children: [
                              smallText(
                                text: 'Code was send to your email',
                                color: Colors.black87,
                                maxLines: 1,
                              ),
                              SizedBox(height: 4.h),
                              Obx(() => normalText(
                                    text: controller.email.value,
                                    color: Colors.black,
                                  )),
                              SizedBox(height: 16.h),
                              Obx(() => smallText(
                                    text:
                                        'This code will expire on ${controller.expiryTime.value} minutes',
                                    color: Colors.grey.shade600,
                                    maxLines: 1,
                                  )),
                            ],
                          ),

                          const Spacer(),

                          // Verify Code Button
                          Obx(() => SizedBox(
                                width: double.infinity,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: controller.isLoading.value
                                      ? null
                                      : controller.verifyCode,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1976D2),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    elevation: 0,
                                    disabledBackgroundColor:
                                        Colors.grey.shade300,
                                  ),
                                  child: controller.isLoading.value
                                      ? SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : Text(
                                          'Verify code',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              )),

                          SizedBox(height: 16.h),

                          // Resend Code Button
                          SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: Obx(() => ElevatedButton(
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
                                    disabledBackgroundColor:
                                        Colors.grey.shade300,
                                  ),
                                  child: controller.isResendLoading.value
                                      ? SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child:
                                              const CircularProgressIndicator(
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
                                )),
                          ),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
