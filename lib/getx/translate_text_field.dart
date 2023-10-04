import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateToSign extends GetxController {
  Rx<TextEditingController> controller = TextEditingController().obs;

  onInit() {
    super.onInit();
    print("TranslateToSign Controller Initialized");
  }
}
