import 'package:flutter/material.dart';

class RealTimeSignText extends StatefulWidget {
  const RealTimeSignText({super.key});

  @override
  State<RealTimeSignText> createState() => _RealTimeSignTextState();
}

class _RealTimeSignTextState extends State<RealTimeSignText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('RealTimeSignText')),
    );
  }
}
