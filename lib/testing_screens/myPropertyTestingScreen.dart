import 'package:flutter/material.dart';

import '../widgets/home_list.dart';

class MyPropertyTestingScreen extends StatefulWidget {
  const MyPropertyTestingScreen({Key? key}) : super(key: key);

  @override
  State<MyPropertyTestingScreen> createState() => _MyPropertyTestingScreenState();
}

class _MyPropertyTestingScreenState extends State<MyPropertyTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return NewProductBuilder();
          },),
      ),
    );
  }
}
