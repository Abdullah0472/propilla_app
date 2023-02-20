import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../colors/colors.dart';
import '../widgets/reuseable_widegts.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Support",
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
                  "Let us know your feedback & queries",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
        contactUsButton(() {
          String call = "tel: ${923124466933}";
          launchUrlString(call);
        }, "  Call Us", const Icon(MdiIcons.phone,size: 30,)),
          const SizedBox(height: 30,),

          contactUsButton(()async {
            String email = Uri.encodeComponent("voicenews@gmail.com");
            Uri mail = Uri.parse("mailto:$email");
            if (await launchUrl(mail)) {
            //email app opened
            }else{
            //email app is not opened
            }
          }, "  Email Us", const Icon(MdiIcons.email,size: 30,))
        ],
      ),
    );
  }
}
