import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:get/get_core/src/get_main.dart';

import '../chat/rooms.dart';
import '../colors/colors.dart';
import 'home_screen.dart';
import 'upload_post_screen.dart';
import 'userSettingScreen.dart';
import '../widgets/navigationBar.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  final List _widgetOptions = [
    const HomeScreen(),

    /// POP-UP Display which contain Highlighted Features of Uploading the Post
    CupertinoPopupSurface(
      child: Padding(
        padding: const EdgeInsets.only(top: 350),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            alignment: Alignment.center,
            width: 350,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Heading of a POP-Up
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Text(
                    "Upload Property",
                    style: GoogleFonts.lato(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: shadowColor,
                      fontSize: 25,
                    ),
                  ),
                ),

                /// First Main Highlighted feature to Upload
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.uploadOutline,
                        size: 35,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Easy Uploading Steps",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: shadowColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                            width: 10,
                          ),
                          Text(
                            "You can upload property details \n by filling the form.",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Second Main Highlighted feature to Upload
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.signatureFreehand,
                        size: 35,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "No Uploading Charges ",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: shadowColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                            width: 10,
                          ),
                          Text(
                            "The Uploads are free of cost, \n no uploading fee and no specific time.",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Third Main Highlighted feature to Upload
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.registeredTrademark,
                        size: 35,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Scam Free Uploads",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: shadowColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                            width: 10,
                          ),
                          Text(
                            "The post is firstly checked,  after that \n the post is uploaded.",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Upload Button (Moving to Upload Screen)
                Center(
                  child: Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(90)),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const UploadPostScreen());

                        Get.to(() => UploadPostScreen());
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return secondary;
                          }
                          return primary;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      child: Text(
                        "Upload Now",
                        style: const TextStyle(
                          color: appBgColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),

                /// ------------------- UPLOAD BUTTON ------------------///
              ],
            ),
          ),
        ),
      ),
    ),

    /// ---------------------------------------- //
    const RoomsPage(),
    const UserSettingScreen(),
  ];

  _onItemTapped(var index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          onTap: () {
            Get.to(() => _onItemTapped);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(MdiIcons.homeCircleOutline),
              title: const Text('Home'),
              activeColor: Colors.green,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(MdiIcons.imagePlusOutline),
              title: const Text('Upload'),
              activeColor: Colors.purpleAccent,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(MdiIcons.messageReplyTextOutline),
              title: const Text(
                'Messages ',
              ),
              activeColor: Colors.pink,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(MdiIcons.accountCircleOutline),
              title: const Text('Account'),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  /// FUNCTION FOR POPUP MENU JUST LIKE IOS DEVICES (nOT Used in this code)
  // cupertinoModalPopup() {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (BuildContext builder) {
  //       return CupertinoPopupSurface(
  //         child: Container(
  //           color: CupertinoColors.white,
  //           alignment: Alignment.center,
  //           width: double.infinity,
  //           height: 400,
  //           child: Center(
  //             child: CupertinoButton(
  //               child: Text("Close"),
  //               onPressed: () {
  //                 Get.to(() => UploadPostScreen());
  //               },
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  /// ------------------------------- ///
}
