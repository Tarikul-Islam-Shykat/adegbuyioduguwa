import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerUpdateProductController extends GetxController{
  final TextEditingController productNameTEC = TextEditingController();
  final TextEditingController totalPriceTEC = TextEditingController();
  final TextEditingController sellingPriceTEC = TextEditingController();
  final TextEditingController discountTEC = TextEditingController();
  final TextEditingController categoryTEC = TextEditingController();
  final TextEditingController descriptionTEC = TextEditingController();
  final TextEditingController detailsTEC = TextEditingController();
  final TextEditingController b2bQuantityTEC = TextEditingController();
  final TextEditingController b2bPriceTEC = TextEditingController();
  final TextEditingController offerQuantityTEC = TextEditingController();
  final TextEditingController offerDiscountTEC = TextEditingController();
  final TextEditingController offerTagTEC = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  RxBool isB2B = false.obs;
  checkB2B(){
    isB2B.value = !isB2B.value;
  }

  final allTags = ['Store product', 'Limited Offer', 'New', 'Discount'].obs;
  final selectedTags = <String>[].obs;

  void addTag(String tag) {
    if (!selectedTags.contains(tag)) {
      selectedTags.add(tag);
    }
  }

  void removeTag(String tag) {
    selectedTags.remove(tag);
  }

  List<String> getFilteredTags(String query) {
    return allTags
        .where((tag) =>
    tag.toLowerCase().contains(query.toLowerCase()) &&
        !selectedTags.contains(tag))
        .toList();
  }

}