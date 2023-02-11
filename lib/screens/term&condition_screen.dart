import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propilla_app/screens/signup_screen.dart';

import '../colors/colors.dart';

class TermConditionScreen extends StatefulWidget {
  const TermConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermConditionScreen> createState() => _TermConditionScreenState();
}

class _TermConditionScreenState extends State<TermConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: Padding(
            padding: const EdgeInsets.only(right: 130),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Terms & Conditions ",
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
        ),
        backgroundColor: appBgColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
            Get.to(() => SignUpScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Company's Terms of Use",
                style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: inActiveColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(
                    width: 2,
                    color: shadowColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 30)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      text: const TextSpan(
                        text:
                            "Tribevibe is a global community of travellers, wanderers, and curious people that thrive under the premise that the world is inherently good. It provides a platform for meaningful connections and experiences. Simply put, it's a community for untourists—for those that travelling is a way of life and a path to self-discovery. ",
                        style: TextStyle(fontSize: 18, color: darker),
                        children: <TextSpan>[],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Terms & Conditions",
                style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: inActiveColor,
                  fontSize: 20,
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
