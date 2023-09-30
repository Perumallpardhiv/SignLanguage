import 'package:flutter/material.dart';

class TranslateTextSign extends StatefulWidget {
  const TranslateTextSign({super.key});

  @override
  State<TranslateTextSign> createState() => _TranslateTextSignState();
}

class _TranslateTextSignState extends State<TranslateTextSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('TranslateTextSign')),
    );
  }
}
