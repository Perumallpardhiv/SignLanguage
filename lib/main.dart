import 'package:flutter/material.dart';
import 'package:signlang/routes/route_constants.dart';
import 'package:signlang/routes/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Varela',
      ),
      initialRoute: RouteConstants.home,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
