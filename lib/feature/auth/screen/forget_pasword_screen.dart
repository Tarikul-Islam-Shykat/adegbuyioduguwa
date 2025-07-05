import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/auth/controller/forget_pasword_controller.dart';

class ForgetPaswordScreen extends StatelessWidget {
  const ForgetPaswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgetPaswordController controller =
        Get.put(ForgetPaswordController());

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
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),

                            // New Password Field
                            Obx(() => TextFormField(
                                  controller: controller.newPasswordController,
                                  focusNode: controller.newPasswordFocusNode,
                                  obscureText:
                                      !controller.isNewPasswordVisible.value,
                                  textInputAction: TextInputAction.next,
                                  validator: controller.validatePassword,
                                  onFieldSubmitted: (_) {
                                    controller.confirmPasswordFocusNode
                                        .requestFocus();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'New password',
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      size: 20.sp,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: controller
                                          .toggleNewPasswordVisibility,
                                      icon: Icon(
                                        controller.isNewPasswordVisible.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 20.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
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
                                )),

                            SizedBox(height: 16.h),

                            // Confirm Password Field
                            Obx(() => TextFormField(
                                  controller:
                                      controller.confirmPasswordController,
                                  focusNode:
                                      controller.confirmPasswordFocusNode,
                                  obscureText: !controller
                                      .isConfirmPasswordVisible.value,
                                  textInputAction: TextInputAction.done,
                                  validator: controller.validateConfirmPassword,
                                  onFieldSubmitted: (_) {
                                    controller.changePassword();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Confirm password',
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      size: 20.sp,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: controller
                                          .toggleConfirmPasswordVisibility,
                                      icon: Icon(
                                        controller
                                                .isConfirmPasswordVisible.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 20.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
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
                                )),

                            const Spacer(),

                            // Change Password Button
                            Obx(() => SizedBox(
                                  width: double.infinity,
                                  height: 50.h,
                                  child: ElevatedButton(
                                    onPressed: controller.isLoading.value
                                        ? null
                                        : controller.changePassword,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1976D2),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
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
                                            'Change password',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                )),

                            SizedBox(height: 20.h),
                          ],
                        ),
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
