import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:propilla_app/controller/loginScreenController.dart';
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
    style: TextStyle(color: shadowColor, fontSize: 17),
    minLines: 1,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icons,
        color: mainColor,
      ),
      labelText: text,
      labelStyle: TextStyle(color: shadowColor, fontSize: 15),
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
