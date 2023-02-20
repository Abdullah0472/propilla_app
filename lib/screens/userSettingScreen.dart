import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../colors/colors.dart';
import '../models/user_profile_model.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  CollectionReference uerRefrence =
      FirebaseFirestore.instance.collection("users");

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: uerRefrence.doc(user!.uid).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? darkBlue : sky,
                  ),
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            UserProfileModel detail =
                UserProfileModel.fromDocumentSnapshot(snapshot: snapshot.data!);

            return Scaffold(
              body: SafeArea(
                child: Column(children: [
                  Text(detail.firstName),
                ],),
              ),
            );
          }
          return SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? darkBlue : sky,
                ),
              );
            },
          );
        });
  }
}
