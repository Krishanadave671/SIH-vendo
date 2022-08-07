import'package:flutter/material.dart';
import 'package:vendo/screens/calendar_screen/calendar.dart';
import 'package:vendo/screens/getStarted_screen/getStarted.dart';
import 'package:vendo/screens/language_selector/language_selector.dart';
import 'package:vendo/screens/login/login_screen.dart';

Route<dynamic>generateRoute(RouteSettings settings){
  switch(settings.name){
    case'/calendar_screen':
      return MaterialPageRoute(builder: (context)=> const Calendar());
    case'/login_screen':
      return MaterialPageRoute(builder: (context)=>const login_screen());
    case'/languageSelect_screen':
      return MaterialPageRoute(builder:(context)=>const language_selector());
    case'/welcome_screen':
      return MaterialPageRoute(builder:(context)=>const getStarted());
    default:
      return MaterialPageRoute(builder:(context)=>const language_selector());
  }
}