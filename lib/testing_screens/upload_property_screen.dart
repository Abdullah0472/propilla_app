import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:propilla_app/controller/loginScreenController.dart';
import 'package:propilla_app/testing_screens/product_image_picker.dart';

import '../colors/colors.dart';
import '../widgets/reuseable_widegts.dart';

class UploadPropertyScreen extends StatefulWidget {
  const UploadPropertyScreen({Key? key}) : super(key: key);

  @override
  State<UploadPropertyScreen> createState() => _UploadPropertyScreenState();
}

class _UploadPropertyScreenState extends State<UploadPropertyScreen> {
  TextEditingController infoTextController = TextEditingController();
  TextEditingController typeTextController = TextEditingController();
  TextEditingController bedTextController = TextEditingController();
  TextEditingController bathTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController areaTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController hospitalTextController = TextEditingController();
  TextEditingController schoolTextController = TextEditingController();
  TextEditingController marketTextController = TextEditingController();
  TextEditingController airportTextController = TextEditingController();
  TextEditingController masjidTextController = TextEditingController();
  TextEditingController parkTextController = TextEditingController();

  GlobalKey<FormState> formkeyUpload = GlobalKey();
  var _userImageFile;
  Map<String, dynamic> productData = {
    "p_name": "",
    "p_bed": "",
    "p_bath": "",
    "p_area": "",
    "p_price": "",
    "p_info": "",
    "p_address": "",
    "p_hospital": "",
    "p_school": "",
    "p_airport": "",
    "p_market": "",
    "p_masjid": "",
    "p_park": "",
    "p_upload_date": DateTime.now().millisecondsSinceEpoch,
    "phone_number": ""
  };

  void _pickedImage(File image) {
    _userImageFile = image;
    print("Image Got $_userImageFile");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkeyUpload,
      child: GetBuilder<LoginScreenController>(
          init: LoginScreenController(),
          builder: (_) {
            return Scaffold(
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
                    padding:
                        const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textDescription("Property Title"),

                        /// Property Title

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: textDataField("Property Title", 50, 365, false,
                              (value) {
                            if (value == null || value.isEmpty) {
                              return 'Property Title Required';
                            }
                            return null;
                          }, (value) {
                            productData['p_name'] = value!;
                          }, typeTextController, 1),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: textDataField(
                                          "Bedroom", 50, 150, true, (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Bed Count Required';
                                        }
                                        return null;
                                      }, (value) {
                                        productData['p_bed'] = value!;
                                      }, bedTextController, 1))
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textDescription("Bathroom"),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: textDataField(
                                        "Bathroom", 50, 150, true, (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Bath Count Required';
                                      }
                                      return null;
                                    }, (value) {
                                      productData['p_bath'] = value!;
                                    }, bathTextController, 1),
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: textDataField("Area", 50, 150, true,
                                        (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Area Required';
                                      }
                                      return null;
                                    }, (value) {
                                      productData['p_area'] = value!;
                                    }, areaTextController, 1),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textDescription("Price"),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: textDataField("Price", 50, 150, true,
                                        (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Price Required';
                                      }
                                      return null;
                                    }, (value) {
                                      productData['p_price'] = value!;
                                    }, priceTextController, 1),
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
                          child: textDataField(
                              "Enter Property Info", 100, 365, false, (value) {
                            if (value == null || value.isEmpty) {
                              return 'Description is Required';
                            }
                            return null;
                          }, (value) {
                            productData['p_info'] = value!;
                          }, infoTextController, 10),
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
                          child: GestureDetector(
                            onTap: () {},
                            child: textDataField(
                                "Property Address", 50, 365, false, (value) {
                              if (value == null || value.isEmpty) {
                                return 'Property address Required';
                              }
                              return null;
                            }, (value) {
                              productData['p_address'] = value!;
                            }, typeTextController, 1),
                          ),
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
                              textDataField("min", 50, 150, true, (value) {
                                if (value == null || value.isEmpty) {
                                  return 'min Required';
                                }
                                return null;
                              }, (value) {
                                productData['p_hospital'] = value!;
                              }, hospitalTextController, 1),
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
                              textDataField("min", 50, 150, true, (value) {
                                if (value == null || value.isEmpty) {
                                  return 'min Required';
                                }
                                return null;
                              }, (value) {
                                productData['p_school'] = value!;
                              }, schoolTextController, 1),
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
                              textDataField("min", 50, 150, true, (value) {
                                if (value == null || value.isEmpty) {
                                  return 'min Required';
                                }
                                return null;
                              }, (value) {
                                productData['p_airport'] = value!;
                              }, airportTextController, 1),
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
                              textDataField("min", 50, 150, true, (value) {
                                if (value == null || value.isEmpty) {
                                  return 'min Required';
                                }
                                return null;
                              }, (value) {
                                productData['p_market'] = value!;
                              }, marketTextController, 1),
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
                              textDataField("min", 50, 150, true, (value) {
                                if (value == null || value.isEmpty) {
                                  return 'min Required';
                                }
                                return null;
                              }, (value) {
                                productData['p_masjid'] = value!;
                              }, masjidTextController, 1),
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
                              textDataField("min", 50, 150, true, (value) {
                                if (value == null || value.isEmpty) {
                                  return 'min Required';
                                }
                                return null;
                              }, (value) {
                                productData['p_park'] = value!;
                              }, parkTextController, 1),
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
                            child: ProductImagePicker(_pickedImage)
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
                                addProduct() {
                                  if (_userImageFile == null) {
                                    Get.snackbar(
                                      "Opps",
                                      "Image Required",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          Theme.of(context).errorColor,
                                      colorText: Colors.white,
                                    );
                                    return;
                                  }

                                  formkeyUpload.currentState!.save();
                                  if (formkeyUpload.currentState!.validate()) {
                                    print("Form is vaid ");

                                    print('Data for login $productData');
                                    _.addNewProduct(
                                        productData, _userImageFile);
                                  }
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
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
            );
          }),
    );
  }

  /// ---------------- TextInputField for Upload Screen Data ----------------------///

  Container textDataField(
    String hinttext,
    double height,
    double width,
    bool numericType,
    String? Function(String?)? Validator,
    Function(dynamic value) onSaved,
    TextEditingController mycontroller,
    int maxLine,
    // {required Null Function(dynamic value) onSaved}
  ) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10)
      ]),
      child: Center(
        child: TextFormField(
          controller: mycontroller,
          validator: Validator,
          onSaved: onSaved,
          decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade400,
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(color: Color(0xffE6E6E6)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(color: Color(0xffE6E6E6)),
              )),
          keyboardType: numericType ? TextInputType.phone : TextInputType.text,
          maxLines: maxLine,
        ),
      ),
    );
  }
}
