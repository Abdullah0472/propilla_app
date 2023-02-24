import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:propilla_app/screens/login_screen.dart';
import 'package:propilla_app/screens/privacy_policy_screen.dart';
import 'package:propilla_app/screens/supportScreen.dart';
import 'package:propilla_app/screens/term&condition_screen.dart';

import '../colors/colors.dart';
import '../models/user_profile_model.dart';
import '../widgets/reuseable_widegts.dart';
import '../widgets/toggle_button.dart';
import 'faqScreen.dart';


class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  CollectionReference uerRefrence =
      FirebaseFirestore.instance.collection("users");

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: uerRefrence.doc(user!.uid).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? darkBlue : sky,
                  ),
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            UserProfileModel detail =
                UserProfileModel.fromDocumentSnapshot(snapshot: snapshot.data!);

            return Scaffold(
              body: SafeArea(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name of the User
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, bottom: 15, top: 25),
                      child: Text(
                        detail.firstName,
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                          color: shadowColor,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    /// EmailAddress of the User
                    Padding(
                      padding: const EdgeInsets.only(left: 25, bottom: 15),
                      child: Text(
                        detail.metadata.email,
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: darker,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          decoration: const BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          alignment: Alignment.center,
                          width: 350,
                          height: 580,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: ToggleButton(),
                                    ),
                                    ListTileInfo(() {
                                      Get.to(() => const SupportScreen());
                                    },
                                        const Icon(
                                          MdiIcons.faceAgent,
                                          size: 30,
                                          color: blue,
                                        ),
                                        "Support",
                                        "Your Feedback & Queries "),
                                    ListTileInfo(() {
                                      Get.to(() => const FAQsScreen());
                                    },
                                        const Icon(
                                          MdiIcons.frequentlyAskedQuestions,
                                          size: 30,
                                          color: blue,
                                        ),
                                        "FAQs",
                                        "Get your question answered "),
                                    ListTileInfo(() {
                                      Get.to(() => const TermConditionScreen());
                                    },
                                        const Icon(
                                          MdiIcons.noteText,
                                          size: 30,
                                          color: blue,
                                        ),
                                        "Term & Conditions",
                                        " Know terms of use "),
                                    ListTileInfo(
                                        () {
                                          Get.to(() => const PrivacyPolicyScreen());
                                        },
                                        const Icon(
                                          MdiIcons.lock,
                                          size: 30,
                                          color: blue,
                                        ),
                                        "Privacy & Policy",
                                        "Company privacy & policy "),
                                    ListTileInfo(() {
                                      FirebaseAuth.instance.signOut();
                                      Get.to(()=> const LoginScreen());
                                    },
                                        const Icon(
                                          MdiIcons.power,
                                          size: 30,
                                          color: blue,
                                        ),
                                        "Logout",
                                        "Sign out from Account "),
                                  ],
                                );
                              })),
                    ),
                  ],
                ),


              ),
            );
          }
          return SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? darkBlue : sky,
                ),
              );
            },
          );
        });
  }
}
