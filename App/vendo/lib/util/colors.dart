import 'package:flutter/material.dart';

class colors {
  colors._();
  static const Color Primarygreen = Color(0xff4163d3);
  static const Color kcPrimaryTextColor = Color(0xff3F414E);
  static const Color kcMediumGreyColor = Color(0xff868686);
  static const Color kcLightGreyColor = Color(0xffAEAEAE);
  static const Color kcVeryLightGreyColor = Color(0xfff2f2f2);
  static const Color kcGreyBackground = Color(0xffe5e5e5);
  static const Color kcLightGreyBackground = Color(0xffEEF2F9);
  static const Color kcCaptionGreyColor = Color(0xff999999);
  static Color get orangelightshade => Colors.orange.shade600; 
  static Color get orangedarkshade => Colors.orange.shade800; 
 static  LinearGradient primaryorangecolor = LinearGradient(colors: [
   orangedarkshade , 
   orangelightshade
]);

  //static const Color primary = Color(0xffF696B1);
  static const Color primary = Color(0xFFFF6B62);
  static const Color primaryLight = Color(0xffFEF4F7);
  static const Color secondary = Color(0xffFDCD96);
  static const Color backgroundColor = Color(0xffFAFAFA);
  static const Color mediumBackgroundColor = Color(0xFFFAC9D7);
  static const Color lightBackgroundColor = Color(0xFFFEF4F7);
}
