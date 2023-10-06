import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signlang/getx/translate_text_field.dart';
import 'package:signlang/routes/route_constants.dart';

class TranslateTextSign extends StatefulWidget {
  const TranslateTextSign({super.key});

  @override
  State<TranslateTextSign> createState() => _TranslateTextSignState();
}

class _TranslateTextSignState extends State<TranslateTextSign> {
  final controller2 = Get.find<TranslateToSign>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Translate Text to Sign",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Your text will be translated to sign language in a natural way and will be displayed on the next screen.",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  fontFamily: '',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepPurple.shade50,
                boxShadow: [BoxShadow(color: Colors.deepPurple, blurRadius: 5)],
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Obx(() => TextField(
                    controller: controller2.controller.value,
                    decoration: InputDecoration(
                      hintText: "Enter your text",
                      border: InputBorder.none,
                    ),
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (controller2.controller.value.text.isNotEmpty) {
            controller2.makePresentIndextoZero();
            Navigator.pushNamed(context, RouteConstants.respectiveSigns);
          }
        },
        icon: Text(
          "Convert",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.75,
            fontSize: 15,
          ),
        ),
        label: Icon(Icons.translate_rounded),
      ),
    );
  }
}
