import 'package:flutter/material.dart';
import 'package:multi_app/screens/intro_screen/intro_screen.dart';

class AppRouter {
  static const String intro = "/";

  static Map<String, WidgetBuilder> get routes {
    return {
      intro: (context) => const IntroScreen()
    };
  }
}
