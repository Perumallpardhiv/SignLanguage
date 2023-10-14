import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signlang/main.dart';
import 'package:tflite/tflite.dart';

class RealTimeSigntoText extends GetxController {
  CameraController controller =
      CameraController(cameras[0], ResolutionPreset.max).obs();
  Rx<CameraImage?> img = Rx<CameraImage?>(null);
  Rx<String> temp = ''.obs;
  Rx<String> result = ''.obs;

  onInit() {
    super.onInit();
    print("RealTimeSigntoText Controller Initialized");
    initTfLite();
  }

  initTfLite() async {
    await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/labels.txt",
    ).then((value) => print("Model Loaded"));
  }

  inItCamera() {
    controller.initialize().then((_) {
      controller.startImageStream((image) => {img.value = image});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  Future<void> predictSign() async {
    if (img.value != null) {
      var recognitions = await Tflite.runModelOnFrame(
        bytesList: img.value!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: img.value!.height,
        imageWidth: img.value!.width,
      );
      print(recognitions);
      if (recognitions?.length != 0) {
        temp.value = recognitions![0]['label'];
        if (temp.value == '_')
          result.value += " ";
        else
          result.value += temp.value;
      }
      Get.snackbar(
        "Sign Converted",
        "Your sign says : $temp",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.deepPurple.shade400,
        colorText: Colors.white,
        borderRadius: 15,
        margin: EdgeInsets.all(20),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }
}
