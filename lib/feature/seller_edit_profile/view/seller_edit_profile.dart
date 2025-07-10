import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/app_colors.dart';
import 'package:prettyrini/core/const/image_path.dart';

import '../../../core/global_widegts/custom_text_field.dart';
import '../controller/seller_edit_profile_controller.dart';

class SellerEditProfile extends StatelessWidget {
   SellerEditProfile({super.key});
   final SellerEditProfileController controller = Get.put(SellerEditProfileController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height*0.13,
              decoration: BoxDecoration(
                color: Color(0xFF007BFF),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
              ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                      Text("Edit profile",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upload shop Banner Image",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlackColor),),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: height*0.2,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200)
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.add,size: 30,color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text("Recommended 1200x300",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF5F6368)),),

                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: height*0.1,
                        width: width*0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade400),
                          color: Colors.white
                        ),
                        alignment: Alignment.center,
                        child:Image.asset(ImagePath.gellary,color: Colors.grey.shade400,),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400),
                            color: Colors.black
                          ),
                          alignment: Alignment.center,
                          child: Text("Replace image",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.white),),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400),
                            color: Colors.white
                          ),
                          alignment: Alignment.center,
                          child: Text("Remove image",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.textBlackColor),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Text("Shop name",style:GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlackColor),),
                  CustomTextField(
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.shopNTEC,
                    hitText: "Enter your shop name",
                  ),

                  SizedBox(height: 15.h,),
                  Text("About shop",style:GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlackColor),),
                  CustomTextField(
                    maxLines: 4,
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.shopNTEC,
                    hitText: "Enter your description about shop",
                  ),

                  SizedBox(height: 15.h,),
                  Text("Location",style:GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.textBlackColor),),
                  CustomTextField(
                    prefixIcon: Icon(Icons.location_on_outlined,color: Colors.grey,),
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.shopNTEC,
                    hitText: "Select your location",
                  ),
                  SizedBox(height: 15.h,),

                  Text("Tags", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
              Obx(() {
                final filteredTags = controller.getFilteredTags(controller.textController.text);
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ...controller.selectedTags.map(
                            (tag) => Chip(
                          label: Text(tag),
                          onDeleted: () => controller.removeTag(tag),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      SizedBox(
                        width: width,
                        child: TextField(
                          controller: controller.textController,
                          focusNode: controller.focusNode,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Add tag',
                            border: InputBorder.none,
                          ),
                          onChanged: (_) {
                            controller.update(); // refresh suggestions
                          },
                          onSubmitted: (value) {
                            if (value.isNotEmpty &&
                                !controller.selectedTags.contains(value)) {
                              controller.addTag(value);
                              controller.textController.clear();
                              controller.update();
                            }
                          },
                        ),
                      ),
                      if (filteredTags.isNotEmpty && controller.focusNode.hasFocus)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 4),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: filteredTags.map((tag) {
                              return ListTile(
                                dense: true,
                                title: Text(tag),
                                onTap: () {
                                  controller.addTag(tag);
                                  controller.textController.clear();
                                  controller.update();
                                  controller.focusNode.requestFocus();
                                },
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                );
              }),
                  SizedBox(height: 100,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
