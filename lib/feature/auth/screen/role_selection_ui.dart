import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';
import '../controller/role_selection_controller.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RoleSelectionController controller =
        Get.put(RoleSelectionController());

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
                  // Header with logo

                  Image.asset(
                    height: 200.h,
                    ImagePath.roleSelection,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),

                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          headingTextV2(
                              text: 'Define your role', color: Colors.black),

                          SizedBox(height: 12.h),

                          // Description
                          smallText(
                              text:
                                  'Create an account or sign in to start shopping your favorite products with ease.',
                              color: Colors.grey,
                              maxLines: 3),

                          SizedBox(height: 32.h),

                          // Role selection options
                          Obx(() => Column(
                                children: controller.roleOptions.map((option) {
                                  bool isSelected =
                                      controller.isRoleSelected(option.role);

                                  return Container(
                                    margin: EdgeInsets.only(bottom: 12.h),
                                    child: InkWell(
                                      onTap: () =>
                                          controller.selectRole(option.role),
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        width: double.infinity,
                                        padding: EdgeInsets.all(16.w),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.blue.shade50
                                              : Colors.white,
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.blue.shade300
                                                : Colors.grey.shade300,
                                            width: isSelected ? 2 : 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        child: Row(
                                          children: [
                                            // Role icon
                                            Container(
                                              width: 24.w,
                                              height: 24.h,
                                              child: Icon(
                                                option.icon,
                                                color: isSelected
                                                    ? Colors.blue.shade600
                                                    : Colors.grey.shade600,
                                                size: 20.sp,
                                              ),
                                            ),

                                            SizedBox(width: 12.w),

                                            // Role text
                                            Expanded(
                                              child: Text(
                                                option.title,
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: isSelected
                                                      ? FontWeight.w600
                                                      : FontWeight.w500,
                                                  color: isSelected
                                                      ? Colors.blue.shade700
                                                      : Colors.black87,
                                                ),
                                              ),
                                            ),

                                            // Selection indicator
                                            AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              width: 20.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: isSelected
                                                    ? Colors.blue.shade600
                                                    : Colors.transparent,
                                                border: Border.all(
                                                  color: isSelected
                                                      ? Colors.blue.shade600
                                                      : Colors.grey.shade400,
                                                  width: 2,
                                                ),
                                              ),
                                              child: isSelected
                                                  ? Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 12.sp,
                                                    )
                                                  : null,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )),

                          SizedBox(height: 32.h),

                          // Continue button
                          Obx(() => SizedBox(
                                width: double.infinity,
                                height: 56.h,
                                child: ElevatedButton(
                                  onPressed: controller.isContinueButtonEnabled
                                      ? controller.continueWithSelectedRole
                                      : null,
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
                                          controller.continueButtonText,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
