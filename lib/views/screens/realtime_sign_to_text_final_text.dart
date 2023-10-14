import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:signlang/getx/realtime_signtoText.dart';

class RealTimeSignFinalText extends StatefulWidget {
  const RealTimeSignFinalText({super.key});

  @override
  State<RealTimeSignFinalText> createState() => _RealTimeSignFinalTextState();
}

class _RealTimeSignFinalTextState extends State<RealTimeSignFinalText>
    with SingleTickerProviderStateMixin {
  RealTimeSigntoText controller1 = Get.find<RealTimeSigntoText>();
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
            Text(
              "Your converted text is ${controller1.result.value}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 5,
                backgroundColor: Colors.deepPurple.shade400,
              ),
              onPressed: () {
                flutterTts
                    .speak("Your converted text is ${controller1.result.value}")
                    .then((value) => print(value));
              },
              icon: const Icon(
                Icons.volume_up,
                color: Colors.white,
                size: 25,
              ),
              label: Text(
                "Speak",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
