import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class UploadImage extends GetxController {
  final ImagePicker image = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  onInit() {
    super.onInit();
    print("UploadImage Controller Initialized");
    initTfLite();
  }

  initTfLite() async {
    await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/labels.txt",
    ).then((value) => print("Model Loaded"));
  }

  void uploadImage() async {
    final photo = await image.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      selectedImage.value = File(photo.path);
    }
  }

  void takeImage() async {
    final photo = await image.pickImage(source: ImageSource.camera);
    if (photo != null) {
      selectedImage.value = File(photo.path);
    }
  }

  void predictSign() async {
    var recognitions = await Tflite.runModelOnImage(
      path: selectedImage.value!.path,
      // numResults: 2,
      // threshold: 0.5,
      // imageMean: 127.5,
      // imageStd: 127.5,
    );
    print(recognitions);
  }
}
