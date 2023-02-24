import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../colors/colors.dart';
import '../models/house_model.dart';
import '../sample_data/data.dart';

class NewProductBuilder extends StatefulWidget {
  // final HouseModel houseDetail;
  const NewProductBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<NewProductBuilder> createState() => _NewProductBuilderState();
}

class _NewProductBuilderState extends State<NewProductBuilder> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 12),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            width: 360,
            height: 130,
          ),
          Positioned(
              top: -10,
              left: 10,
              child: Container(
                  height: 111.4,
                  width: 107,
                  child: Image.asset("Assets/images/home.jpg",
                      fit: BoxFit.cover))),
          Positioned(
              top: 10,
              left: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Testing Heading",
                          style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            color: shadowColor,
                            fontSize: 18,
                          ),
                          children: const [
                        // TextSpan(
                        //     text: "Testing Address ",
                        //     style: const TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 15,
                        //         color: Color(0xff000000))),
                      ])),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      Icon(
                        MdiIcons.mapMarker,
                        color: Color(0xff9B9B9B),
                        size: 20,
                      ),
                      Text(
                        " Testing Address",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff9B9B9B)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: const [
                      Icon(
                        MdiIcons.bedSingleOutline,
                        color: Color(0xff9B9B9B),
                        size: 20,
                      ),
                      Text(
                        " 03",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff9B9B9B)),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Icon(
                        MdiIcons.shower,
                        color: Color(0xff9B9B9B),
                        size: 20,
                      ),
                      Text(
                        " 02",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff9B9B9B)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PKR 1500 ",
                    style: GoogleFonts.lato(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w900,
                      color: shadowColor,
                      fontSize: 20,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
