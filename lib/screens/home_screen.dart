import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propilla_app/home_screen_widgets/houses.dart';

import '../colors/colors.dart';
import '../home_screen_widgets/bottom_buttons.dart';
import '../home_screen_widgets/categories.dart';
import '../home_screen_widgets/categories_button_testing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                RichText(
                  text: TextSpan(
                      text: 'I want to ',
                      style: GoogleFonts.lato(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: shadowColor,
                        fontSize: 25,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Buy',
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
                      text: 'Apartment',
                      style: GoogleFonts.lato(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: shadowColor,
                        fontSize: 25,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' in ',
                          style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: shadowColor,
                            fontSize: 25,
                          ),
                        ),
                        TextSpan(
                          text: 'Pakistan',
                          style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: shadowColor,
                            fontSize: 25,
                          ),
                        )
                      ]),
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
                    CategoryButtonTesting(title: '15000', onTap: (){
                      print("<15000");
                      Get.to(HomeScreen());
                    },),
                    CategoryButtonTesting(title: 'For Sale', onTap: (){
                      print("For Sale");
                      Get.to(HomeScreen());
                    },),
                    CategoryButtonTesting(title: '3-4 bed room', onTap: (){
                      print("3-4 bed rooms");
                      Get.to(HomeScreen());
                    },),
                    CategoryButtonTesting(title: 'Garages', onTap: (){
                      print("Garages");
                      Get.to(HomeScreen());
                    },),
                    CategoryButtonTesting(title: 'Modular kitchen', onTap: (){
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
}
