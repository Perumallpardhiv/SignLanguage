import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateToSign extends GetxController {
  Rx<TextEditingController> controller = TextEditingController().obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<int> present_index = 0.obs;

  onInit() {
    super.onInit();
    print("TranslateToSign Controller Initialized");
  }

  makePresentIndextoZero() {
    present_index.value = 0;
  }

  increasePresentIndex() {
    if (present_index.value < controller.value.text.length - 1) {
      present_index.value++;
    }
  }

  decreasePresentIndex() {
    if (present_index.value > 0) {
      present_index.value--;
    }
  }

  scrollListView(double value) {
    scrollController.value.animateTo(
      value,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
