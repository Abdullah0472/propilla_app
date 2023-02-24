
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../colors/colors.dart';

TextFormField reusableTextField(
  String text,
  IconData icons,
  bool isPasswordType,
  TextEditingController controller,
  String? Function(String?)? validator,
) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: const TextStyle(color: shadowColor, fontSize: 17),
    minLines: 1,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icons,
        color: mainColor,
      ),
      labelText: text,
      labelStyle: const TextStyle(color: shadowColor, fontSize: 15),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(width: 2, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: validator,
  );
}

/// SignUp and Login Button

Container signUpsignUpButton(
    BuildContext context, String title, Function onTap) {
  return Container(
    width: 250,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return secondary;
          }
          return primary;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: appBgColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

/// Heading Text over text form field

Text textHeading(
  String text,
) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: shadowColor,
      fontSize: 18,
    ),
  );
}

/// Intl Phone Field Widegt
IntlPhoneField phoneField(
  TextEditingController phoneController,
) {
  return IntlPhoneField(
    controller: phoneController,
    initialCountryCode: "Pakistan",
    decoration: InputDecoration(
      hintText: "Enter Your Phone Number",
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(width: 2, style: BorderStyle.none),
      ),
    ),
    onChanged: (phone) {
      print(phone.completeNumber);
    },
    onCountryChanged: (country) {
      print('Country changed to: ' + country.name);
    },
  );
}

/// Heading Text over text-form-field in data entry in upload post screen

Text textDescription(
  String text,
) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: shadowColor,
      fontSize: 18,
    ),
  );
}

/// ---------------- TextInputField for Upload Screen Data ----------------------///

Container textInputField(
  String hinttext,
  double height,
  double width,
  bool numericType,
  String? Function(String?)? Validator,
  TextEditingController mycontroller,
  int maxLine,
    // {required Null Function(dynamic value) onSaved}
) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.1), spreadRadius: 5, blurRadius: 10)
    ]),
    child: Center(
      child: TextFormField(
        controller: mycontroller,
        validator: Validator,
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
 /// This Custom Widget is using to upload image in upload post screen
GestureDetector ImageConatiner(
    VoidCallback onTapp,
    ){
  return GestureDetector(
    onTap: onTapp,
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
         color: red,
          borderRadius: BorderRadius.circular(20),

      ),
      child: const Center(child: Icon(MdiIcons.camera,size: 35,color: white,)),
    ),
  );
}

/// User Personal Setting Screen Widget

GestureDetector ListTileInfo(
    VoidCallback clicky,
    Icon iconDisplay,
    String title,
    String subtitle,
    ){
  return GestureDetector(
    onTap: clicky,
    child: Padding(
      padding: const EdgeInsets.only(left: 20,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        iconDisplay,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(title, style: GoogleFonts.lato(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: shadowColor,
                fontSize: 22,
              ),),
              SizedBox(height: 7,),

              Text(subtitle,style: GoogleFonts.lato(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: inActiveColor,
                fontSize: 19,
              ),)
            ],),
          )
        ],
      ),
    ),
  );
}


/// Button for Support Screen

GestureDetector contactUsButton(
    VoidCallback clickme,
    String heading,
    Icon icon,
    ){
  return GestureDetector(
    onTap: clickme,
    child: Center(
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: textBoxColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: darker,)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(heading, style: GoogleFonts.lato(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: shadowColor,
              fontSize: 20,
            ),),
           icon,

          ],
        ),
      ),
    )
  );
}


