import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/auth/controller/login_controller.dart';
import 'package:prettyrini/feature/auth/controller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

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
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: controller.navigateToSignUp,
                                child: normalText(
                                    text: 'SIGN IN', color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              headingTextV2(
                                  text: 'Sign Up', color: Colors.white),
                              SizedBox(height: 8.h),
                              smallText(
                                  text:
                                      'Create an account or sign in to start shopping your favorite products with ease.',
                                  color: Colors.white,
                                  maxLines: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            // Email field
                            TextFormField(
                              controller: controller.fullNameController,
                              focusNode: controller.nameFocusNode,
                              keyboardType: TextInputType.twitter,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                controller.passwordFocusNode.requestFocus();
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your Full Name',
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 20.sp,
                                  color: Colors.grey,
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
                            ),

                            SizedBox(height: 16.h),

                            TextFormField(
                              controller: controller.emailController,
                              focusNode: controller.emailFocusNode,
                              keyboardType: TextInputType.twitter,
                              textInputAction: TextInputAction.next,
                              validator: controller.validateEmail,
                              onFieldSubmitted: (_) {
                                controller.passwordFocusNode.requestFocus();
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 20.sp,
                                  color: Colors.grey,
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
                            ),

                            SizedBox(height: 16.h),
                            Obx(() => TextFormField(
                                  controller: controller.passwordController,
                                  focusNode: controller.passwordFocusNode,
                                  obscureText:
                                      !controller.isPasswordVisible.value,
                                  textInputAction: TextInputAction.done,
                                  validator: controller.validatePassword,
                                  // onFieldSubmitted: (_) {
                                  //   controller.signInWithEmail();
                                  // },
                                  decoration: InputDecoration(
                                    hintText: 'Your Password',
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      size: 20.sp,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed:
                                          controller.togglePasswordVisibility,
                                      icon: Icon(
                                        controller.isPasswordVisible.value
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

                            SizedBox(
                              height: 16.h,
                            ),

                            Obx(() => TextFormField(
                                  controller:
                                      controller.confirmPasswordController,
                                  focusNode:
                                      controller.confirmPasswordFocusNode,
                                  obscureText:
                                      !controller.isPasswordVisible.value,
                                  textInputAction: TextInputAction.done,
                                  validator: controller.validatePassword,
                                  // onFieldSubmitted: (_) {
                                  //   controller.signInWithEmail();
                                  // },
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      size: 20.sp,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed:
                                          controller.togglePasswordVisibility,
                                      icon: Icon(
                                        controller.isPasswordVisible.value
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

                            SizedBox(height: 8.h),

                            SizedBox(height: 10.h),

                            // Login button
                            Obx(() => SizedBox(
                                  width: double.infinity,
                                  height: 40.h,
                                  child: ElevatedButton(
                                    onPressed: controller.isLoading.value
                                        ? null
                                        : controller.signUp,
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
                                            'Create Account',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                )),

                            SizedBox(height: 20.h),

                            // Create account text
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                smallText(
                                    text:
                                        'By Sign up you agree to your terms & condition and privacy policy',
                                    color: Colors.black,
                                    maxLines: 3),
                              ],
                            ),
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
