import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../colors/colors.dart';

class LoginScreenController extends GetxController {
  // TextEditingController for Email and Password

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Hint Text and Label Text of Email TextFormField and Password TextFormField
  String textUser = "Enter Your Name";
  String textEmail = "Enter Your Email ";
  String textPass = "Enter Your Password ";
  String textPhone = "Enter Your Phone Number";

  // Icons of Email TextFormField and Password TextFormField
  IconData usericons = Icons.person;
  IconData emailicons = Icons.email_outlined;
  IconData passicons = Icons.lock_outline;
  IconData phoneicons = Icons.numbers_outlined;

  FocusNode focusNode = FocusNode();

  // Password Type
  bool passwordType = true;

// Validator of Email
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Email";
    }
    if (!GetUtils.isEmail(value)) {
      return "Enter Proper email address";
    }
    return null;
  }

// Validator of Password
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain a lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain a special character';
    }
    return null;
  }


  String? userValidator(String? value) {
    if (!value!.contains(RegExp(r'^[a-zA-Z0-9 ]+$'))) {
      return 'Enter Some Alphabets ';
    }
  }


  onLoginPressed() {
    Get.snackbar("Login Status", "Successfully Logged in",
        backgroundColor: Colors.pink, colorText: Colors.white);
    Get.defaultDialog(
        title: "Status", content: const Text("Successfully Logged in"));
  }

  String titleLogin = "Login";
  String titleSignup = "Sign-Up";

  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  // }

  /// Signup through Google Authentication
  Future<UserCredential> signWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  /// SignUp with the Email Address and Password
  static CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  static LoginScreenController instance = Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
  }) async {
    bool status = false;
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? currentUser = credential.user;

      if (currentUser != null) {
        Map<String, dynamic> userProfileData = {
          "name": userName,
          "email": email,
          "uid": currentUser.uid,
          "phone": phoneNumber,
        };

        ///
        await FirebaseChatCore.instance.createUserInFirestore(types.User(
          id: credential.user!.uid,
          firstName: userName,
          metadata: userProfileData,
        ));

        String? token = await FirebaseMessaging.instance.getToken();
        DocumentReference urf =
            FirebaseFirestore.instance.collection("users").doc(currentUser.uid);
        urf.update({"firebasetoken": token});

        ///
        //   DocumentReference currentUserReference =
        //       userReference.doc(currentUser.uid);
        //   Map<String, dynamic> userProfileScreen = {
        //     "name": userName,
        //     "email": email,
        //     "uid": currentUser.uid,
        //
        //   };
        //   await currentUserReference.set(userProfileScreen);
      }
      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Massage",
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account Creation Failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
    return status;
  }

  /// Login with Email and Password

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    bool status = false;
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? currentUser = credential.user;

      String? token = await FirebaseMessaging.instance.getToken();
      DocumentReference urf =
          FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
      urf.update({"firebasetoken": token});

      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Massage",
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account Creation Failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
    return status;
  }

  /// Reset Password

  resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';

      if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: boxColor);
    } catch (e) {
      Get.snackbar('Error occured!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: boxColor);
    }
  }

  /// SignOut

}
