import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signlang/getx/getx.dart';
import 'package:signlang/routes/route_constants.dart';
import 'package:signlang/routes/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final UploadImage controller = Get.put(UploadImage());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
