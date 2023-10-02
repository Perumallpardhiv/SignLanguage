import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signlang/getx/getx.dart';

class UploadSignText extends StatefulWidget {
  const UploadSignText({super.key});

  @override
  State<UploadSignText> createState() => _UploadSignTextState();
}

class _UploadSignTextState extends State<UploadSignText> {
  final UploadImage controller = Get.find<UploadImage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                  child: (controller.selectedImage.value == null)
                      ? Center(
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
                                      controller.takeImage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurple.shade400,
                                      shape: const StadiumBorder(),
                                    ),
                                    icon: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    label: Text(
                                      "Camera",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      controller.uploadImage();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurple.shade400,
                                      shape: const StadiumBorder(),
                                    ),
                                    icon: const Icon(
                                      Icons.image_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    label: Text(
                                      "Upload",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Image.file(
                          controller.selectedImage.value!,
                          fit: BoxFit.cover,
                        ),
                );
              }),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () async {
                // setState(() {
                //   loading = true;
                // });
                // await Tflite.runModelOnImage(
                //         path: photo!.path, // required
                //         asynch: true // defaults to true
                //         )
                //     .then((value) {
                //   print(value![0]["label"].toString());
                //   String res = value[0]["label"].toString().split(" ").last;
                //   // print(res);
                //   loading = false;
                //   Get.to(() => SpeechScreen(res),
                //       transition: Transition.leftToRight);
                //   // print(value!.asMap()["label"]);
                //   // print(value);
                // });
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.deepPurple.shade300,
                shape: const StadiumBorder(),
              ),
              icon: const Icon(
                Icons.volume_up_outlined,
                color: Colors.white,
                size: 30,
              ),
              label: Text(
                "Done",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
