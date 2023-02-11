import 'package:flutter/material.dart';

import '../colors/colors.dart';

class PasswordTextField extends StatefulWidget {
  final String text;
  final IconData icons;
  bool isPasswordType;
  final TextEditingController controllerpass;

  final String? Function(String?)? validator;
  PasswordTextField(
      {Key? key,
      required this.text,
      required this.icons,
      required this.isPasswordType,
      required this.controllerpass,
      this.validator})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  void inContact(TapDownDetails details) {
    setState(() {
      widget.isPasswordType = false;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      widget.isPasswordType=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllerpass,
      obscureText: widget.isPasswordType,
      enableSuggestions: widget!.isPasswordType,
      autocorrect: widget!.isPasswordType,
      cursorColor: Colors.white,
      style: const TextStyle(color: shadowColor, fontSize: 17),
      minLines: 1,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icons,
          color: mainColor,
        ),
        labelText: widget.text,
        labelStyle: const TextStyle(color: shadowColor, fontSize: 15),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 2, style: BorderStyle.none),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child:  GestureDetector(
            onTapDown: inContact,//call this method when incontact
            onTapUp: outContact,//call this method when contact with screen is removed
            child: const Icon(
              Icons.remove_red_eye,
              color: shadowColor,
            ),
          ),
        ),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      validator: widget.validator,
    );
  }
}
