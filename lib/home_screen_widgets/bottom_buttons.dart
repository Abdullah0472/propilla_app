import 'package:flutter/material.dart';

import '../colors/colors.dart';


class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: InkWell(
        onTap: (){
          print("Working Map View Button");
        },
        child: Container(
          width: size.width * 0.4,
          height: 60,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(
              color: darkBlue.withOpacity(0.6),
              offset: const Offset(0,10),
              blurRadius: 10
            )]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon((Icons.map_outlined),color: white,),
               Text(' Map view',style: TextStyle(
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
