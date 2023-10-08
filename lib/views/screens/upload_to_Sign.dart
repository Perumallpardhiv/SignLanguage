import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signlang/getx/upload_imgtoSign.dart';

class UploadSignText extends StatefulWidget {
  const UploadSignText({super.key});

  @override
  State<UploadSignText> createState() => _UploadSignTextState();
}

class _UploadSignTextState extends State<UploadSignText> {
  final UploadImage controller1 = Get.find<UploadImage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          children: [
            Center(
              child: Text(
                "UPLOAD IMAGE",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.deepPurple.shade100,
                    ),
                  ],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Roboto",
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: (controller1.selectedImage.value == null)
                      ? Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.upload_file_rounded,
                                  size: 60,
                                  color: Colors.deepPurple,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "Upload Image to continue...",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepPurple.shade200,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        controller1.takeImage();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepPurple.shade400,
                                        shape: const StadiumBorder(),
                                      ),
                                      icon: Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        "Camera",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        controller1.uploadImage();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepPurple.shade400,
                                        shape: const StadiumBorder(),
                                      ),
                                      icon: const Icon(
                                        Icons.image_sharp,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        "Upload",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Image.file(controller1.selectedImage.value!),
                );
              }),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.grey.shade800,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    controller1.takeImage();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await controller1.predictSign();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.deepPurple.shade300,
                    shape: const StadiumBorder(),
                  ),
                  icon: const Icon(
                    Icons.volume_up_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.grey.shade800,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    controller1.uploadImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.upload_file_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
