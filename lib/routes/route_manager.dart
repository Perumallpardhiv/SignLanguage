import 'package:flutter/material.dart';
import 'package:signlang/routes/route_constants.dart';
import 'package:signlang/views/screens/home.dart';
import 'package:signlang/views/screens/learn_signs.dart';
import 'package:signlang/views/screens/realtime_sign_to_text.dart';
import 'package:signlang/views/screens/realtime_sign_to_text_final_text.dart';
import 'package:signlang/views/screens/respective_signs.dart';
import 'package:signlang/views/screens/respective_text_page.dart';
import 'package:signlang/views/screens/translate_text_to_sign.dart';
import 'package:signlang/views/screens/upload_to_Sign.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return MaterialPageRoute(builder: (context) => Home());

      case RouteConstants.upload:
        return MaterialPageRoute(builder: (context) => UploadSignText());

      case RouteConstants.textPage:
        return MaterialPageRoute(builder: (context) => TextPage());

      case RouteConstants.translate:
        return MaterialPageRoute(builder: (context) => TranslateTextSign());

      case RouteConstants.respectiveSigns:
        return MaterialPageRoute(builder: (context) => RespectiveSigns());

      case RouteConstants.realtime:
        return MaterialPageRoute(builder: (context) => RealTimeSignText());

      case RouteConstants.realtimeFinaltext:
        return MaterialPageRoute(builder: (context) => RealTimeSignFinalText());

      case RouteConstants.learnsigns:
        return MaterialPageRoute(builder: (context) => LearnSigns());

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
