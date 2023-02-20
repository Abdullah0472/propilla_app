import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:password_field_validator/password_field_validator.dart';
import 'package:propilla_app/controller/loginScreenController.dart';
import 'package:propilla_app/screens/home_screen.dart';
import 'package:propilla_app/screens/login_screen.dart';
import 'package:propilla_app/screens/term&condition_screen.dart';

import '../colors/colors.dart';
import '../widgets/password_textfield.dart';
import '../widgets/reuseable_widegts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formkeysignup = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
        init: LoginScreenController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign up Now ",
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          color: shadowColor,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Look like you're not registered yet ",
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: darker,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: appBgColor,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            body: Form(
              key: formkeysignup,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      // SizedBox(height: 25,),
                      textHeading("Full Name"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: reusableTextField(
                            _.textUser,
                            _.usericons,
                            _.passwordType = false,
                            _.userController,
                            _.userValidator),
                      ),
                      //SizedBox(height: 25,),
                      textHeading("Phone Number"),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: phoneField(_.phoneController)),

                      textHeading("Password"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: PasswordTextField(
                          text: _.textPass,
                          icons: _.passicons,
                          isPasswordType: _.passwordType = true,
                          controllerpass: _.passwordController,
                          validator: _.validatePassword,
                        ),
                      ),



                      Center(
                        child: signUpsignUpButton(context, _.titleSignup,
                            () async {
                          if (formkeysignup.currentState!.validate()) {
                            LoginScreenController.instance.signUpUser(
                                email: _.emailController.text,
                                password: _.passwordController.text,
                                userName: _.userController.text,
                                phoneNumber: _.phoneController.text);
                            print("Email");
                            _.onLoginPressed();
                            _.passwordController.clear();
                            _.phoneController.clear();
                            _.userController.clear();
                            _.emailController.clear();
                            Get.to(() => const HomeScreen());
                          }
                        }),
                      ),
                      Center(
                        child: Text(
                          "By Continue you're agreed to our",
                          style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: darker,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                alignment: Alignment.bottomCenter,
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 600),
                                reverseDuration:
                                    const Duration(milliseconds: 600),
                                type: PageTransitionType.bottomToTopJoined,
                                child: const TermConditionScreen(),
                                childCurrent: const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Term & Conditions",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: blue,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
