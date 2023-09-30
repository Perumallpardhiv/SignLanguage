import 'package:flutter/material.dart';

class LearnSigns extends StatefulWidget {
  const LearnSigns({super.key});

  @override
  State<LearnSigns> createState() => _LearnSignsState();
}

class _LearnSignsState extends State<LearnSigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('LearnSigns')),
    );
  }
}
