import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CreatePostController extends GetxController {

  TextEditingController infoTextController = TextEditingController();
  TextEditingController typeTextController = TextEditingController();
  TextEditingController bedTextController = TextEditingController();
  TextEditingController bathTextController = TextEditingController();
  TextEditingController areaTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController hospitalTextController = TextEditingController();
  TextEditingController schoolTextController = TextEditingController();
  TextEditingController marketTextController = TextEditingController();
  TextEditingController airportTextController = TextEditingController();
  TextEditingController masjidTextController = TextEditingController();
  TextEditingController parkTextController = TextEditingController();

  static CollectionReference postReference =
      FirebaseFirestore.instance.collection("post");

  User? currentuser = FirebaseAuth.instance.currentUser;

  File? postImageFile;
  String postImageUpdateKey = "postImageUpdatekey";

  // Validator Function For Alphabetical Use in Upload Post Screen

  String? propertyTitleValidator(String? value){
    if (value == null || value.isEmpty) {
      return "Following thing is required";
    } else if ((!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(value))) {
      return 'Please Enter Some text ';
    }
  }

  // Validator Function For Numeric Use in Upload Post Screen

  String? propertyNumericValidator(String? value){
    if (value == null || value.isEmpty) {
      return "Count is required";
    } else if (value.isEmpty && !RegExp(r'^[0-9 ]+$').hasMatch(value)) {
      return 'Numeric Value is Allowed  ';
    }
  }

/// Pick Image Code this is my code which is having error
  // pickPostImage(BuildContext context) async {
  //   final ImagePicker _picker = ImagePicker();
  //   // Pick an image
  //   final XFile? image = await _picker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   // final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
  //
  //   if (image != null) {
  //     CroppedFile? croppedFile = await ImageCropper().cropImage(
  //       sourcePath: image.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio16x9
  //       ],
  //       uiSettings: [
  //         AndroidUiSettings(
  //             toolbarTitle: 'Cropper',
  //             toolbarColor: Colors.deepOrange,
  //             toolbarWidgetColor: Colors.white,
  //             initAspectRatio: CropAspectRatioPreset.original,
  //             lockAspectRatio: false),
  //         IOSUiSettings(
  //           title: 'Cropper',
  //         ),
  //         WebUiSettings(
  //           context: context,
  //         ),
  //       ],
  //     );
  //     if (croppedFile != null) {
  //       postImageFile = File(croppedFile.path);
  //       print("image.path: ${image.path}");
  //       update([postImageUpdateKey]);
  //       onInit();
  //       // await  uploadPostImageToFirebase(context);
  //     }
  //   }
  // }




  // ignore: unnecessary_overrides

  /// ------------------- Only Image from gallery for uploading image to firestore ------------------- ///

  Future<File?> pickPostImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<String?> uploadImageToFirebase(File imageFile, String userId,) async {
    try {
      /// Upload image to Firebase Storage
      final fileName = imageFile.path;
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('user_profile_images')
          .child('$userId/$fileName');
      final uploadTask = storageRef.putFile(imageFile);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Store download URL in Firestore
      final userRef = FirebaseFirestore.instance.collection('post').doc(userId);
      await userRef.update({'profileImageUrl': downloadUrl});

      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firebase: $e');
      return null;
    }
  }

  /// -------------------------------------------------- ///
  void onInit() {
    super.onInit();
  }

  void addPostToFirestore(
      {
        required String title,
        required String bed,
        required String bath,
        required String area,
        required String price,
        required String info,
        required String hospital,
        required String school,
        required String airport,
        required String market,
        required String masjid,
        required String park,
      // required String userimageurl,
      required String username,
        required String phone,
      })
  async {

    User? user = FirebaseAuth.instance.currentUser;
    String UniqueName = DateTime.now().microsecondsSinceEpoch.toString();

    /// UPLOAD IMAGE TO FIREBASE
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    firebase_storage.Reference ref =
        storage
            .ref()
            .child("post")
            .child(UniqueName);

    try {
   //   store the file
    await ref.putFile(postImageFile!);
      /// -------------------- CHAT GPT  ----------------------- ///
      /// --------------- Different Method -------------------- ///
      // final storageRef = firebase_storage.FirebaseStorage.instance
      //     .ref()
      //     .child('post')
      //     .child(UniqueName);
      //
      // final uploadTask = storageRef.putFile(postImageFile);
      // final snapshot = await uploadTask.whenComplete(() {});
      // final downloadUrl = await snapshot.ref.getDownloadURL();

      /// Send Image URL to Firestore
     String imagePostUrl = "";
     imagePostUrl = await ref.getDownloadURL();

     if (imagePostUrl != null) {
        String uid = '';
        //print("uid:$uid");
        if (user != null) {
          uid = user!.uid;
        }



     //    print("uid:$uid");
        // var format = DateFormat.yMd('ar');
        // var nowdatetime = format.format(DateTime.now());
        String nowdatetime = DateTime.now().microsecondsSinceEpoch.toString();

        Map<String, dynamic> data = {
          "uid": uid,
          "title": title,
          "bed":bed,
          "bath":bath,
          "area": area,
          "price":price,
          "info":info,
          "hospital":hospital,
          "school":school,
          "airport":airport,
          "market":market,
          "masjid":masjid,
          "park":park,
       //  "userImageUrl": userimageurl,
          "datetimepost": nowdatetime,
          "username": username,
          "postImageUrl": imagePostUrl,
          "phoneNo": phone,
        };

        postReference
            .add(data)
            .then((value) => print("Successfully add to firestore"))
            .onError((error, stacktrace) => print("Error is =  $error"));

     }
    } catch (e) {
      print(e);
    }
  }

  /// This Function is for like
 /// Currently we are not using

  // Future<void> likespost(String postid, String uid, List likes) async {
  //   try {
  //     if (likes.contains(uid)) {
  //       await postReference.doc(postid).update({
  //         // if the likes list contains the user uid, we need to remove it
  //         'likes': FieldValue.arrayRemove([uid]),
  //         "likecount": FieldValue.increment(-1),
  //       });
  //     } else {
  //       await postReference.doc(postid).update({
  //         // else we need to add uid to the likes array
  //         'likes': FieldValue.arrayUnion([uid]),
  //         "likecount": FieldValue.increment(1),
  //       });
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

/// ------------------------------------ ///
}
