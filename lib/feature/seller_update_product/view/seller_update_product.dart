import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/global_widegts/custom_text_field.dart';
import '../controlller/seller_update_product_controller.dart';

class SellerUpdateProduct extends StatelessWidget {
   SellerUpdateProduct({super.key});
   final SellerUpdateProductController controller = Get.put(SellerUpdateProductController());

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
                        Text("Upload product",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
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
                  Text("Product Info",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.textBlackColor),),
                  SizedBox(height: 16.h,),
                  Text("Product Name",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  CustomTextField(
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.productNameTEC,
                    hitText: "Enter your product name",
                  ),
                  SizedBox(height: 16.h,),
                  Text("Total Price",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  CustomTextField(
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.totalPriceTEC,
                    hitText: "Total Price",
                  ),

                  SizedBox(height: 16.h,),
                  Text("Selling Price",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  CustomTextField(
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.sellingPriceTEC,
                    hitText: "Selling Price",
                  ),

                  SizedBox(height: 16.h,),
                  Text("Discount",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  CustomTextField(
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.discountTEC,
                    hitText: "10%",
                  ),

                  SizedBox(height: 16.h,),
                  Text("Product Category",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  CustomTextField(
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.categoryTEC,
                    hitText: "Product Category",
                  ),

                  SizedBox(height: 16.h,),
                  Text("Product description",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  CustomTextField(
                    maxLines: 3,
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.descriptionTEC,
                    hitText: "Product description",
                  ),

                  SizedBox(height: 16.h,),
                  Text("Product details",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  CustomTextField(
                    maxLines: 3,
                    borderColor: Colors.grey.shade200,
                    textEditingController:controller.detailsTEC,
                    hitText: "Product details",
                  ),
                  Row(
                    children: [
                      Text("Bundles and B2B available",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.blackColor),),
                      Obx((){
                          return Transform.scale(
                            scale: 0.70,
                            child: Switch(
                              activeColor: Color(0xFF007BFF),
                                value: controller.isB2B.value,
                                onChanged: (v){
                              controller.isB2B.value = v;
                            }),
                          );
                        }
                      )
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Text("B2B package",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.blackColor),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grayColor),),
                            CustomTextField(
                              borderColor: Colors.grey.shade200,
                              textEditingController:controller.b2bQuantityTEC,
                              hitText: "1-49/pcs",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Price / pcs",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grayColor),),
                            CustomTextField(
                              borderColor: Colors.grey.shade200,
                              textEditingController:controller.b2bPriceTEC,
                              hitText: "\$ ",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.add,color: AppColors.primaryColor,size: 18,),
                        SizedBox(width: 4,),
                        Text("Add",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.primaryColor),),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h,),
                  Text("Bundles offer",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.blackColor),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grayColor),),
                            CustomTextField(
                              borderColor: Colors.grey.shade200,
                              textEditingController:controller.offerQuantityTEC,
                              hitText: "1-49/pcs",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grayColor),),
                            CustomTextField(
                              borderColor: Colors.grey.shade200,
                              textEditingController:controller.offerDiscountTEC,
                              hitText: "\$ ",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tag",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.grayColor),),
                            CustomTextField(
                              borderColor: Colors.grey.shade200,
                              textEditingController:controller.offerTagTEC,
                              hitText: "Tag",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Icon(Icons.add,color: AppColors.primaryColor,size: 18,),
                        SizedBox(width: 4,),
                        Text("Add",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.primaryColor),),

                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Products Photo",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.textBlackColor),),
                  SizedBox(height: 5,),
                  SizedBox(height: height*0.13,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                      itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      height: height*0.13,
                      width: width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade200),
                        color: Colors.grey.shade200,
                      ),
                      child: index == 0
                          ? Icon(Icons.add)
                          : SizedBox.shrink(),
                    );
                  }),),

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
            ),
          ],
        ),
      ),
    );
  }
}
