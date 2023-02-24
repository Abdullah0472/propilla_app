import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propilla_app/controller/postScreenController.dart';

import '../models/house_model.dart';
import '../widgets/home_list.dart';

class MyPropertyScreen extends StatefulWidget {
  const MyPropertyScreen({Key? key}) : super(key: key);

  @override
  State<MyPropertyScreen> createState() => _MyPropertyScreenState();
}

class _MyPropertyScreenState extends State<MyPropertyScreen> {
  CollectionReference uerRefrence =
      FirebaseFirestore.instance.collection("users");

  CollectionReference postRefrence =
      FirebaseFirestore.instance.collection("post");

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePostController>(
        init: CreatePostController(),
        builder: (_) {
          return FutureBuilder(
              future: uerRefrence.doc(user!.uid).get(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Document does not exist");
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Scaffold(
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          FutureBuilder<QuerySnapshot>(
                              future: postRefrence.get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text("Something went wrong");
                                }
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      //  scrollDirection: Axis.vertical,
                                      physics: const ScrollPhysics(),
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> doc =
                                            snapshot.data!.docs[index].data()
                                                as Map<String, dynamic>;
                                        String docId =
                                            snapshot.data!.docs[index].id;
                                        HouseModel detail =
                                            HouseModel.fromJson(doc, docId);

                                        return NewProductBuilder();
                                      }
                                      );
                                }
                                return Text("Loading");
                              }),
                        ],
                      ),
                    ),
                  );
                }
                return Text("Loading");
              });
        });
  }
}
