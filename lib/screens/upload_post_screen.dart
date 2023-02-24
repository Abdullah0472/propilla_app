import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../colors/colors.dart';
import '../controller/postScreenController.dart';
import '../models/user_profile_model.dart';
import '../widgets/reuseable_widegts.dart';
import 'navBar_Screen.dart';

class UploadPostScreen extends StatelessWidget {
  final UserProfileModel userdetail;
  const UploadPostScreen({Key? key, required this.userdetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkeyUpload = GlobalKey();
    return GetBuilder<CreatePostController>(
      init: CreatePostController(),
      builder: (_) {
        return Form(
          key: formkeyUpload,
          child: Scaffold(
            /// AppBar of Upload Post Screen

            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Upload Property",
                      style: GoogleFonts.lato(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: shadowColor,
                        fontSize: 25,
                      ),
                    ),
                  ],
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
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textDescription("Property Title"),

                      /// Property Title

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: textInputField(
                            "Enter the Property Title",
                            50,
                            365,
                            false,
                            _.propertyTitleValidator,
                            _.typeTextController,
                            1),
                      ),

                      /// Information of Bath and Bedroom

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textDescription("Bedroom"),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: textInputField(
                                      "Bedroom",
                                      50,
                                      150,
                                      true,
                                      _.propertyNumericValidator,
                                      _.bedTextController,
                                      1),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textDescription("Bathroom"),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: textInputField(
                                      "Bathroom",
                                      50,
                                      150,
                                      true,
                                      _.propertyNumericValidator,
                                      _.bathTextController,
                                      1),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// Information of Area and Price

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textDescription("Area"),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: textInputField(
                                      "Enter Area",
                                      50,
                                      150,
                                      true,
                                      _.propertyNumericValidator,
                                      _.areaTextController,
                                      1),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textDescription("Price"),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: textInputField(
                                      "Enter Price",
                                      50,
                                      150,
                                      true,
                                      _.propertyNumericValidator,
                                      _.priceTextController,
                                      1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// Property Information/Description in 10 Lines Maximum

                      textDescription("About Property"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: textInputField(
                            "Enter Property Info",
                            100,
                            365,
                            false,
                            _.propertyTitleValidator,
                            _.infoTextController,
                            10),
                      ),

                      /// Divider of Location

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(children: <Widget>[
                          const Expanded(
                              child: Divider(
                            thickness: 3,
                          )),
                          Text(
                            "  Location  ",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: shadowColor,
                              fontSize: 22,
                            ),
                          ),
                          const Expanded(
                              child: Divider(
                            thickness: 3,
                          )),
                        ]),
                      ),
                      textDescription("Enter Property Location"),

                      // Need Working on this for future

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: textInputField(
                            "Enter Property Info",
                            50,
                            365,
                            false,
                            _.propertyTitleValidator,
                            _.infoTextController,
                            1),
                      ),

                      /// Utilities Section

                      // Heading

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add Utilities",
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: shadowColor,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Distance in time",
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: inActiveColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Hospital

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  MdiIcons.hospital,
                                  size: 35,
                                ),
                                Text(
                                  "   Hospital",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: shadowColor,
                                  ),
                                ),
                              ],
                            ),
                            textInputField(
                                "min",
                                50,
                                120,
                                false,
                                _.propertyTitleValidator,
                                _.hospitalTextController,
                                1)
                          ],
                        ),
                      ),

                      // School

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  MdiIcons.school,
                                  size: 35,
                                ),
                                Text(
                                  "   School",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: shadowColor,
                                  ),
                                ),
                              ],
                            ),
                            textInputField(
                                "min",
                                50,
                                120,
                                false,
                                _.propertyTitleValidator,
                                _.schoolTextController,
                                1)
                          ],
                        ),
                      ),

                      // Airport

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  MdiIcons.airplane,
                                  size: 35,
                                ),
                                Text(
                                  "   Airport",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: shadowColor,
                                  ),
                                ),
                              ],
                            ),
                            textInputField(
                                "min",
                                50,
                                120,
                                false,
                                _.propertyTitleValidator,
                                _.airportTextController,
                                1)
                          ],
                        ),
                      ),

                      // Market

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  MdiIcons.shopping,
                                  size: 35,
                                ),
                                Text(
                                  "   Market",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: shadowColor,
                                  ),
                                ),
                              ],
                            ),
                            textInputField(
                                "min",
                                50,
                                120,
                                false,
                                _.propertyTitleValidator,
                                _.marketTextController,
                                1)
                          ],
                        ),
                      ),

                      // Masjid

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  MdiIcons.mosque,
                                  size: 35,
                                ),
                                Text(
                                  "   Masjid",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: shadowColor,
                                  ),
                                ),
                              ],
                            ),
                            textInputField(
                                "min",
                                50,
                                120,
                                false,
                                _.propertyTitleValidator,
                                _.masjidTextController,
                                1)
                          ],
                        ),
                      ),

                      // Park

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  MdiIcons.grass,
                                  size: 35,
                                ),
                                Text(
                                  "   Park",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: shadowColor,
                                  ),
                                ),
                              ],
                            ),
                            textInputField(
                                "min",
                                50,
                                120,
                                false,
                                _.propertyTitleValidator,
                                _.parkTextController,
                                1)
                          ],
                        ),
                      ),

                      /// Divider for Photos

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(children: <Widget>[
                          const Expanded(
                              child: Divider(
                            thickness: 3,
                          )),
                          Text(
                            "  Photos  ",
                            style: GoogleFonts.lato(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: shadowColor,
                              fontSize: 22,
                            ),
                          ),
                          const Expanded(
                              child: Divider(
                            thickness: 3,
                          )),
                        ]),
                      ),

                      /// Photos Box to insert

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          color: boxColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /// Pick 1st Image
                                  GestureDetector(
                                    onTap: () {
                                      _.pickPostImage(context);
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: _.postImageFile != null
                                          ? Image.file(
                                              _.postImageFile!,
                                              fit: BoxFit.fill,
                                            )
                                          : const Center(
                                              child: Icon(
                                                MdiIcons.camera,
                                                size: 35,
                                                color: white,
                                              ),
                                            ),
                                    ),
                                  ),

                                  ImageConatiner(
                                    () {},
                                  ),
                                  ImageConatiner(
                                    () {},
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ImageConatiner(
                                    () {},
                                  ),
                                  ImageConatiner(
                                    () {},
                                  ),
                                  ImageConatiner(
                                    () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      /// Upload Button which is Non-Custom all code is inside this widget

                      Center(
                        child: Container(
                          width: 300,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90)),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formkeyUpload.currentState!.validate()) {
                                print("Upload Button");
                                _.addPostToFirestore(
                                    title: _.typeTextController.text,
                                    bed: _.bedTextController.text,
                                    bath: _.bathTextController.text,
                                    area: _.areaTextController.text,
                                    price: _.priceTextController.text,
                                    info: _.infoTextController.text,
                                    hospital: _.hospitalTextController.text,
                                    school: _.schoolTextController.text,
                                    airport: _.airportTextController.text,
                                    market: _.marketTextController.text,
                                    masjid: _.masjidTextController.text,
                                    park: _.parkTextController.text,
                                    // userimageurl: userdetail.profileImageUrl,
                                    username: userdetail.metadata.name,


                                );

                                Get.to(() => const BottomNavigationBarScreen());

                                _.typeTextController.clear();
                                _.bedTextController.clear();
                                _.bathTextController.clear();
                                _.areaTextController.clear();
                                _.priceTextController.clear();
                                _.infoTextController.clear();
                                _.hospitalTextController.clear();
                                _.schoolTextController.clear();
                                _.airportTextController.clear();
                                _.marketTextController.clear();
                                _.masjidTextController.clear();
                                _.parkTextController.clear();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return green;
                                }
                                return darkBlue;
                              }),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            child: const Text(
                              "Upload",
                              style: TextStyle(
                                color: appBgColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
