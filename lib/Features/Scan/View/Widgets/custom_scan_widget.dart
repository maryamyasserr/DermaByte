import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomScanWidget extends StatelessWidget {
  String? image;
  String title, subTitle;
  CustomScanWidget(
      {super.key, this.image, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: mediaQuery.height * 0.2089,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Row(children: [
          Column(
            children: [
              Image.asset(image?? ''),
            ],
          ),
          SizedBox(width: mediaQuery.width * 0.07),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mediaQuery.height * 0.025),
              Text(
                title,
                style: Styels.textStyle20_700,
              ),
              SizedBox(height: mediaQuery.height * 0.025),
              Text(
                subTitle,
                style: Styels.textStyle16_400.copyWith(fontSize: 14),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
