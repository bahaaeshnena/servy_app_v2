import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPageController extends GetxController {
  var isChecked = false.obs;
  var labelColor = Colors.black.obs;

  void updateLabelColor() {
    labelColor.value = isChecked.value ? Colors.black : Colors.grey;
  }
}
