import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vendo/screens/Main_page/mainpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset("assets/animations/flag.json"),
      nextScreen: const MainPage(),
      splashIconSize: 500,
      duration: 5000,
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
