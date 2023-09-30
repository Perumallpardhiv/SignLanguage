import 'package:flutter/material.dart';

class UploadSignText extends StatefulWidget {
  const UploadSignText({super.key});

  @override
  State<UploadSignText> createState() => _UploadSignTextState();
}

class _UploadSignTextState extends State<UploadSignText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Upload Sign Text')),
    );
  }
}
