import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_edspert/views/book_app/home_book.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var splash = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Grapedia',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      ),
    );

    return AnimatedSplashScreen(
      splash: splash,
      splashTransition: SplashTransition.fadeTransition,
      duration: 700,
      nextScreen: const BookHome(),
      backgroundColor: Colors.blue,
    );
  }
}
