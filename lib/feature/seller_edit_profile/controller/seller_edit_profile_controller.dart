import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerEditProfileController extends GetxController{
  final TextEditingController shopNTEC = TextEditingController();
  final TextEditingController shopAboutTEC = TextEditingController();
  final TextEditingController shopLocationTEC = TextEditingController();
  final TextEditingController shopTagTEC = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();




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