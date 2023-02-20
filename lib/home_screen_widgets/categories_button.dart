import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CategoryButton extends StatefulWidget {
  final String title;
  final Function onTap;
  const CategoryButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  int selectedCategoryIndex = 0;
  int? index;
  @override
  Widget build(BuildContext context,) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index =0;
        });
        widget.onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: appPadding / 3),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
          decoration: BoxDecoration(
            color: selectedCategoryIndex == index
                ? darkBlue
                : black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedCategoryIndex == index ? white : black),
            ),
          ),
        ),
      ),
    );
  }
}
