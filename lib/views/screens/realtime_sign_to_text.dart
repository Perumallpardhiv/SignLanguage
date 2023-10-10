import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signlang/getx/realtime_signtoText.dart';

class RealTimeSignText extends StatefulWidget {
  const RealTimeSignText({super.key});

  @override
  State<RealTimeSignText> createState() => _RealTimeSignTextState();
}

class _RealTimeSignTextState extends State<RealTimeSignText> {
  final RealTimeSigntoText controller1 = Get.find<RealTimeSigntoText>();

  @override
  void initState() {
    super.initState();
    controller1.inItCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Obx(
                  () => controller1.img.value != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CameraPreview(controller1.controller),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.deepPurple.shade400,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    controller1.predictSign();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.deepPurple.shade400,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    controller1.finalOutput();
                  },
                  child: Row(
                    children: [
                      Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 19,
                      ),
                    ],
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
