import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signlang/getx/translate_text_field.dart';

class RespectiveSigns extends StatefulWidget {
  const RespectiveSigns({super.key});

  @override
  State<RespectiveSigns> createState() => _RespectiveSignsState();
}

class _RespectiveSignsState extends State<RespectiveSigns> {
  final controller2 = Get.find<TranslateToSign>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Converted Signs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Obx(() => controller2.controller.value
                          .text[controller2.present_index.value].isAlphabetOnly
                      ? Image.asset(
                          'assets/signs/${controller2.controller.value.text[controller2.present_index.value]}.png',
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 45),
                          child: Image.asset(
                            'assets/signs/_.png',
                            width: 150,
                            height: 150,
                          ),
                        )),
                ),
                Obx(() {
                  if (controller2.controller.value.text.isNotEmpty) {
                    print("Present: ${controller2.present_index.value}");
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        controller: controller2.scrollController.value,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller2.controller.value.text.length,
                        itemBuilder: (context, index) {
                          return Text(
                            controller2.controller.value.text[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: index == controller2.present_index.value
                                  ? Colors.green.shade600
                                  : Colors.black,
                              letterSpacing: 1.5,
                              fontFamily: 'Varela',
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                }),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          controller2.decreasePresentIndex();
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.75,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          controller2.scrollListView(
                              controller2.present_index.value * 27.0);
                          controller2.increasePresentIndex();
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.75,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
