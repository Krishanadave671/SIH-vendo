import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:translator/translator.dart';

class StringsList {
  static String language = "English";

  //welcome Screen / getStarted
  static String hi = "Hello Vendors!!";
  static String tagline = "Let's start with revolution";
  static String message =
      "Vendors are empowered by people like us . wow you are soo smart . I wish I was you!!";
  static String start = "Get Started";

  //loginScreen
  static String signIn =
      "Let's sign you in\nWelcome back\nYou have been missed";
  static String login = "Login";
  static String loginbtn = "Login";
  static String password = 'must contain special character either . * @ # \$';
  static String newVendor = 'New Vendor ? ';
  static String register = "Register";

  static List<String> nameString = [
    "hi",
    "tagline",
    "message",
    "start",
    "signIn",
    "login",
    "loginbtn",
    "password",
    "newVendor",
    "register",
  ];

  static Map<String, String> translate = {
    "hi": hi,
    "tagline": tagline,
    "message": message,
    "start": start,
    "signIn": signIn,
    "login": login,
    "loginbtn": loginbtn,
    "password": password,
    "newVendor": newVendor,
    "register": register,
  };

  static Future<void> convert() async {
    log(language);
    GoogleTranslator translator = GoogleTranslator();
    for (int i = 0; i < translate.length; i++) {
      var translation = await translator.translate(translate[nameString[i]]!,
          from: 'en', to: 'hi');
      translate[nameString[i]] = translation.text;
      log(translation.text);
    }
  }
}
