import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import 'package:prettyrini/feature/auth/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

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
                                    text: 'SIGN UP', color: Colors.white),
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
                                  text: 'Sign in', color: Colors.white),
                              SizedBox(height: 8.h),
                              smallText(
                                  text:
                                      'Let\'s sign in to start shopping your favorite products with sellapy.',
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
                              controller: controller.emailController,
                              focusNode: controller.emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: controller.validateEmail,
                              onFieldSubmitted: (_) {
                                controller.passwordFocusNode.requestFocus();
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
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

                            // Password field
                            Obx(() => TextFormField(
                                  controller: controller.passwordController,
                                  focusNode: controller.passwordFocusNode,
                                  obscureText:
                                      !controller.isPasswordVisible.value,
                                  textInputAction: TextInputAction.done,
                                  validator: controller.validatePassword,
                                  onFieldSubmitted: (_) {
                                    controller.signInWithEmail();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Password',
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

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: controller.navigateToForgotPassword,
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 10.h),

                            // Login button
                            Obx(() => SizedBox(
                                  width: double.infinity,
                                  height: 40.h,
                                  child: ElevatedButton(
                                    onPressed: controller.isLoading.value
                                        ? null
                                        : controller.signInWithEmail,
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
                                            'Log in',
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
                                    text: 'If you don\'t have an account yet? ',
                                    color: Colors.black),
                                GestureDetector(
                                  onTap: controller.navigateToCreateAccount,
                                  child: smallText(
                                    text: 'Create new account',
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Text(
                                    'Or',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.h),

                            // Social login buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                smallText(
                                    text: 'Log in with:', color: Colors.black),
                                SizedBox(width: 16.w),

                                // Google
                                GestureDetector(
                                  onTap: controller.signInWithGoogle,
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.g_mobiledata,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                // Facebook
                                GestureDetector(
                                  onTap: controller.signInWithFacebook,
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                // Apple
                                GestureDetector(
                                  onTap: controller.signInWithApple,
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.apple,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),

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
