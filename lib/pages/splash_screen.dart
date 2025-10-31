import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:wtracker/pages/information_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: Lottie.asset("assets/splashicon/dumbell_animation.json"),),
      nextScreen: InformationScreen(),
      splashIconSize: 300,
      backgroundColor: CupertinoColors.white,
      duration: 1350,
    );
  }
}
