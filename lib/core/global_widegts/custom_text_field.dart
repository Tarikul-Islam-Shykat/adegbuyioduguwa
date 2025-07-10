import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hitText,
    required this.textEditingController,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.borderColor=Colors.black,
    this.maxLines=1, this.suffixIcon, this.prefixIcon,
  });
  final String? hitText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final TextEditingController textEditingController;
  final Color borderColor;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(

      maxLines:maxLines ,
      controller: textEditingController,
      style: GoogleFonts.poppins(
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: lineHeight ?? 24.h / 16.h,
          color: AppColors.grayColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        hintText: hitText,
        suffixIcon:suffixIcon ,
        prefixIcon:prefixIcon ,
        hintStyle: GoogleFonts.poppins(
            fontSize: fontSize ?? 12.sp,
            fontWeight: fontWeight ?? FontWeight.w400,
            height: lineHeight ?? 24.h / 16.h,
            color: AppColors.grayColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:  BorderSide(color:borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide:  BorderSide(color:borderColor, width: 1),
        ),
      ),
    );
  }
}
