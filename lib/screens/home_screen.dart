import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:propilla_app/home_screen_widgets/houses.dart';

import '../colors/colors.dart';
import '../home_screen_widgets/bottom_buttons.dart';
import '../home_screen_widgets/categories.dart';
import '../home_screen_widgets/categories_button.dart';
import '../models/user_profile_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CollectionReference uerRefrence =
  FirebaseFirestore.instance.collection("users");

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        appBar: AppBar(

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Padding(
              padding: const EdgeInsets.only(right: 100,left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '${detail.firstName} want to ',
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: shadowColor,
                          fontSize: 25,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Buy Apartment ',
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: shadowColor,
                              fontSize: 25,
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'in ',
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: shadowColor,
                          fontSize: 25,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Pakistan',
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: shadowColor,
                              fontSize: 25,
                            ),
                          )
                        ]
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
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(MdiIcons.logout,color: Colors.black,size: 30,)),
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Categories(),

                /// Category Custom Widget Testing

                Padding(
                  padding: const EdgeInsets.only(
                    left: appPadding,
                    top: appPadding / 2,
                    bottom: appPadding,
                  ),
                  child: Container(
                    height: size.height * 0.05,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CategoryButton(title: '15000', onTap: (){
                              print("<15000");
                              Get.to(HomeScreen());
                            },),
                            CategoryButton(title: 'For Sale', onTap: (){
                              print("For Sale");
                              Get.to(HomeScreen());
                            },),
                            CategoryButton(title: '3-4 bed room', onTap: (){
                              print("3-4 bed rooms");
                              Get.to(HomeScreen());
                            },),
                            CategoryButton(title: 'Garages', onTap: (){
                              print("Garages");
                              Get.to(HomeScreen());
                            },),
                            CategoryButton(title: 'Modular kitchen', onTap: (){
                              print("Modular Kitchen");
                              Get.to(HomeScreen());
                            },),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                /// Custom Widget Testing
                Houses(),

              ],
            ),
            BottomButtons(),
          ],

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
    }
    );

  }
}
