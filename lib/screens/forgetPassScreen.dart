import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:propilla_app/controller/loginScreenController.dart';
import 'package:propilla_app/screens/login_screen.dart';

import '../colors/colors.dart';
import '../utils/utils.dart';
import '../widgets/reuseable_widegts.dart';

class ForgotPasswords extends StatefulWidget {
  const ForgotPasswords({Key? key}) : super(key: key);

  @override
  State<ForgotPasswords> createState() => _ForgotPasswordsState();
}

class _ForgotPasswordsState extends State<ForgotPasswords> {
  GlobalKey<FormState> formkeypass = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<LoginScreenController>(
            init: LoginScreenController(),
            builder: (_) {
              return Form(
                key: formkeypass,
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Forgot Password",
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w800,
                                color: shadowColor,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Please enter your email address. You will receive a link to create a new password via email.",
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                color: darker,
                              ),
                            ),
                          ],
                        ),
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
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: InkWell(
                            onTap: () async {
                              if (formkeypass.currentState!.validate()) {
                                bool status =
                                    await _.resetPassword(_.emailController.text);
                                if (status) {
                                  _.emailController.clear();
                                  Get.to(LoginScreen());

                                } else {
                                  utils().toastmessage("Invalid Email");
                                }
                              }
                            },
                            child: Container(
                              height: 71,
                              width: 71,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [blue, sky])),
                              child: const Icon(
                                CupertinoIcons.arrow_right,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
