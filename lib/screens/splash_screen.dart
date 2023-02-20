import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propilla_app/screens/home_screen.dart';
import 'package:propilla_app/screens/login_screen.dart';
import 'package:propilla_app/screens/upload_post_screen.dart';

import '../colors/colors.dart';
import 'navBar_Screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 6), () {
        Get.to(() => BottomNavigationBarScreen());
      });
    } else {
      Timer(const Duration(seconds: 6), () {
        Get.to(() => LoginScreen());
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("Assets/images/real_estate_logo.jpg"),
                  //color: Colors.blue,
                  colorBlendMode: BlendMode.darken,
                  height: 350,
                  width: 180,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Propilla ',
                      textStyle: GoogleFonts.lato(
                          fontStyle: FontStyle.italic,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          textStyle: Theme.of(context).textTheme.headline3),
                      speed: const Duration(milliseconds: 400),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 400),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image(
                image: AssetImage("Assets/images/house.jpg"),
                height: 200,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ));
  }
}
