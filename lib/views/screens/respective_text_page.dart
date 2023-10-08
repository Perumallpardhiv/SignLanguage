import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:signlang/getx/upload_imgtoSign.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  FlutterTts flutterTts = FlutterTts();
  UploadImage controller1 = Get.find<UploadImage>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(() {
        return Center(
          child: controller1.isLoading.value
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      controller1.label.value,
                      style: TextStyle(
                        fontSize: 200,
                        fontFamily: 'Varela',
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(w * 0.85, h * 0.075),
                        backgroundColor: Colors.deepPurple.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        await flutterTts.speak(controller1.label.value);
                      },
                      icon: Icon(Icons.volume_up_rounded, size: 27),
                      label: Text(
                        "Speak",
                        style: TextStyle(
                          color: Colors.deepPurple.shade600,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          fontSize: 18,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
