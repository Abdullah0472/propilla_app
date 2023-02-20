import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(right: 90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "FAQs",
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    color: shadowColor,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Your Question got answered",
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: darker,
                    fontSize: 20,
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
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
      ),
      body:    SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: RichText(
            text: const TextSpan(
              text:
              "Tribevibe is a global community of travellers, wanderers, and curious people that thrive under the premise that the world is inherently good. It provides a platform for meaningful connections and experiences. Simply put, it's a community for untourists—for those that travelling is a way of life and a path to self-discovery.Tribevibe is a global community of travellers, wanderers, and curious people that thrive under the premise that the world is inherently good. It provides a platform for meaningful connections and experiences. Simply put, it's a community for untourists—for those that travelling is a way of life and a path to self-discovery. Tribevibe is a global community of travellers, wanderers, and curious people that thrive under the premise that the world is inherently good. It provides a platform for meaningful connections and experiences. Simply put, it's a community for untourists—for those that travelling is a way of life and a path to self-discovery. Tribevibe is a global community of travellers, wanderers, and curious people that thrive under the premise that the world is inherently good. It provides a platform for meaningful connections and experiences. Simply put, it's a community for untourists—for those that travelling is a way of life and a path to self-discovery. Tribevibe is a global community of travellers, wanderers, and curious people that thrive under the premise that the world is inherently good. It provides a platform for meaningful connections and experiences. Simply put, it's a community for untourists—for those that travelling is a way of life and a path to self-discovery. Tribevibe is a global community of travellers, wanderers, and curious people that thrive under the premise that the world is inherently good. It provides a platform for meaningful connections and experiences. Simply put, it's a community for untourists—for those that travelling is a way of life and a path to self-discovery.  ",
              style: TextStyle(fontSize: 18, color: darker),
              children: <TextSpan>[],
            ),
          ),
        ),
      ),
    );
  }
}
