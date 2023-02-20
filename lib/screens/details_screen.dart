import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../detail_screen_widget/bottom_buttons.dart';
import '../detail_screen_widget/carousel_testing.dart';
import '../detail_screen_widget/custom_app_bar.dart';
import '../detail_screen_widget/house_details.dart';
import '../models/house_model.dart';


class DetailsScreen extends StatefulWidget {

  final HouseModel house;

  const DetailsScreen({Key? key, required this.house}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    List<String> recipents = [(widget.house.phoneNumber)];
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselTesting(house: widget.house,),
                  // CarouselImages(widget.house.moreImagesUrl),
                CustomAppBar(),

                ],
              ),
             HouseDetails(widget.house),
            ],
          ),
          BottomButtons(
            smsonTap: (){
          _sendSMS("Hi, I saw your Ads in Propilla and I want to see your property when you will be available ", recipents);
            },
            onTap: () {

            String call = "tel: ${widget.house.phoneNumber}";
            launchUrlString(call);

          },),
        ],
      ),
    );
  }

  /// ----- This Function is for moving to SMS Screen with including custom message ----- ///

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
  /// ---------------------------------------- ///
}
