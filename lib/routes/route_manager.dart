import 'package:flutter/material.dart';
import 'package:signlang/routes/route_constants.dart';
import 'package:signlang/views/screens/home.dart';
import 'package:signlang/views/screens/learn_signs.dart';
import 'package:signlang/views/screens/realtime_sign_to_text.dart';
import 'package:signlang/views/screens/special_sign.dart';
import 'package:signlang/views/screens/translate_text_to_sign.dart';
import 'package:signlang/views/screens/upload_to_Sign.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(builder: (context) => Home());

      case RouteConstants.upload:
        return MaterialPageRoute(builder: (context) => UploadSignText());

      case RouteConstants.translate:
        return MaterialPageRoute(builder: (context) => TranslateTextSign());

      case RouteConstants.realtime:
        return MaterialPageRoute(builder: (context) => RealTimeSignText());

      case RouteConstants.learnsigns:
        return MaterialPageRoute(builder: (context) => LearnSigns());

      case RouteConstants.specialsigns:
        return MaterialPageRoute(builder: (context) => SpecialSigns());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
