import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propilla_app/controller/loginScreenController.dart';
import 'package:propilla_app/screens/signup_screen.dart';

import '../colors/colors.dart';
import '../utils/utils.dart';
import '../widgets/password_textfield.dart';
import '../widgets/reuseable_widegts.dart';
import 'forgetPassScreen.dart';
import 'home_screen.dart';
import 'navBar_Screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    return GetBuilder<LoginScreenController>(
        init: LoginScreenController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: cardColor,
            // resizeToAvoidBottomInset: false,
            body: Form(
              key: formkey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and Name of the Application
                    Center(
                      child: Stack(
                        children: [
                          const Image(
                            image: AssetImage(
                                "Assets/images/real_estate_logo.jpg"),
                            //color: Colors.blue,
                            colorBlendMode: BlendMode.darken,
                            height: 350,
                            width: 180,
                          ),
                          Positioned(
                            bottom: 50,
                            left: 20,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  'Propilla ',
                                  textStyle: GoogleFonts.lato(
                                      fontStyle: FontStyle.italic,
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headline3),
                                  speed: const Duration(milliseconds: 400),
                                ),
                              ],
                              totalRepeatCount: 4,
                              pause: const Duration(milliseconds: 400),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Signin Text
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi mate, ",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: darker,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Sign in Now ",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800,
                              color: shadowColor,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // TextFormField

                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textHeading("Email Address"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: reusableTextField(
                                _.textEmail,
                                _.emailicons,
                                _.passwordType = false,
                                _.emailController,
                                _.emailValidator),
                          ),
                          textHeading("Password"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: PasswordTextField(
                              text: _.textPass,
                              icons: _.passicons,
                              isPasswordType: _.passwordType = true,
                              controllerpass:_.passwordController,
                              validator: _.validatePassword,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(

                              onPressed: () {

                                _.emailController.clear();
                                _.passwordController.clear();

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswords()));
                              },
                              child: const Text("Forgot your password?",style: TextStyle(fontSize: 17,color:blue),),
                            ),
                          ),
                          Center(
                            child: signUpsignUpButton(
                                context, _.titleLogin, () async {
                                  if(formkey.currentState!.validate()){
                                    bool status =   await _.loginUser(
                                        email: _.emailController.text,
                                        password: _.passwordController.text);
                                    _.emailController.clear();
                                    _.passwordController.clear();
                                    _.onLoginPressed();
                                    if(status){
                                      Get.to(() => BottomNavigationBarScreen());

                                    }
                                    else {
                                      utils().toastmessage("Failed to Login");
                                    }
                                  }
                            }),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an Account?  ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: shadowColor,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                 _.emailController.clear();
                                 _.passwordController.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                                  );

                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "Login with Social",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: const Color(0xff5D5D5D),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _.signWithGoogle().then((UserCredential value){
                                      Get.to(() => BottomNavigationBarScreen());
                                    });
                                  },
                                  child: Container(

                                    height: 63,
                                    width: 92,
                                    decoration: const BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20))),
                                    child: Center(
                                      child: Image.asset(
                                        "Assets/icons/Gmail.png",
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 63,
                                  width: 92,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  child: Center(
                                    child: Image.asset(
                                      "Assets/icons/Facebook.png",
                                      height: 62,
                                      width: 92,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ),
          );
        });
  }
}
