import 'package:flutter/material.dart';

class SpecialSigns extends StatefulWidget {
  const SpecialSigns({super.key});

  @override
  State<SpecialSigns> createState() => _SpecialSignsState();
}

class _SpecialSignsState extends State<SpecialSigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('SpecialSigns')),
    );
  }
}
