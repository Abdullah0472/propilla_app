import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: Padding(
            padding: const EdgeInsets.only(right:180 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Privacy Policy",
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
              Get.back();
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
                "Company's Privacy of Use",
                style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: inActiveColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
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
                  borderRadius: const BorderRadius.all(Radius.elliptical(10, 30)),
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
              const SizedBox(
                height: 20,
              ),
              Text(
                "Privacy Policies ",
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
