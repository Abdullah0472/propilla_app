import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                      ]
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Apartment in ',
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home Screen")
        ],
      ),
    );
  }
}
