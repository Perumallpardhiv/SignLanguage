import 'package:flutter/material.dart';
import 'package:signlang/views/utils/list.dart';

class LearnSigns extends StatefulWidget {
  const LearnSigns({super.key});

  @override
  State<LearnSigns> createState() => _LearnSignsState();
}

class _LearnSignsState extends State<LearnSigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "All Signs on ASL Database",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/signs/${list[index]}.png'),
              ),
            );
          },
        ),
      ),
    );
  }
}
